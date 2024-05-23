import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/profile/view/page/profile_page.dart';
import 'package:tecnofit_challenge_app/features/signin/signin.dart';

part 'signin_bloc_event.dart';
part 'signin_bloc_state.dart';

class SigninBloc extends Bloc<SigninBlocEvent, SigninBlocState> {
  late SigninAUserUseCase _registerUser;
  late GetUserUseCase _getUser;

  SigninBloc([SigninAUserUseCase? registerUser, GetUserUseCase? getUser])
      : super(const SigninBlocState()) {
    _registerUser = registerUser ?? GetIt.I.get<SigninAUserUseCase>();
    _getUser = getUser ?? GetIt.I.get<GetUserUseCase>();
    on<SigninRequested>((event, emit) {
      String email = event.email;
      String password = event.password;
      return _signin(
        registerUser: _registerUser,
        event: event,
        emit: emit,
        email: email,
        password: password,
      );
    });
    on<ResetRequested>((event, emit) {
      return _resetRequested(event: event, emit: emit);
    });
    on<ProfilePageRequested>((event, emit) {
      BuildContext context = event.context;
      User user = event.user;
      return _onProfilePageRequested(
        event: event,
        emit: emit,
        context: context,
        user: user,
      );
    });
  }
  Future<void> _onProfilePageRequested({
    required SigninBlocEvent event,
    required Emitter<SigninBlocState> emit,
    required BuildContext context,
    required User user,
  }) async {
    emit(state.copyWith(
      status: SigninStatus.success,
    ));
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ProfilePage(user: user),
      ),
    );
  }

  void _resetRequested({
    required SigninBlocEvent event,
    required Emitter<SigninBlocState> emit,
  }) {
    emit(state.copyWith(
      status: SigninStatus.initial,
      error: null,
    ));
  }

  Future<void> _signin({
    required SigninAUserUseCase registerUser,
    required SigninBlocEvent event,
    required Emitter<SigninBlocState> emit,
    required String email,
    required String password,
  }) async {
    try {
      if (state.status == SigninStatus.initial) {
        emit(state.copyWith(status: SigninStatus.loading));
        final result = await registerUser.call(
          email: email,
          password: password,
        );
        final getUserResponse = await _getUser.call();
        if (result.hasError || getUserResponse.hasError) {
          return emit(state.copyWith(
            status: SigninStatus.failure,
            error: result.error!,
          ));
        }

        if (result.data != null && getUserResponse.data != null) {
          User user = getUserResponse.data!.copyWith(token: result.data!.token);

          return emit(state.copyWith(
            status: SigninStatus.success,
            user: user,
          ));
        }
        return emit(state.copyWith(
          status: SigninStatus.failure,
          error: result.error!,
        ));
      }
    } catch (e) {
      return emit(state.copyWith(
        status: SigninStatus.failure,
        error: 'An error occurred while registering the user.',
      ));
    }
  }
}
