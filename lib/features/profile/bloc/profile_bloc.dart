import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/view/page/signin_page.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc() : super(const ProfileBlocState()) {
    on<ProfilePageLoaded>((event, emit) {
      User user = event.user;
      return _onProfilePageLoaded(event: event, emit: emit, user: user);
    });
    on<SignOutRequested>((event, emit) {
      BuildContext context = event.context;
      return _signOutRequested(event: event, emit: emit, context: context);
    });
  }

  Future<void> _onProfilePageLoaded({
    required ProfileBlocEvent event,
    required Emitter<ProfileBlocState> emit,
    required User user,
  }) async {
    emit(state.copyWith(
      status: ProfileStatus.success,
      user: user,
    ));
  }

  Future<void> _signOutRequested({
    required ProfileBlocEvent event,
    required Emitter<ProfileBlocState> emit,
    required BuildContext context,
  }) async {
    emit(state.copyWith(
      status: ProfileStatus.initial,
    ));
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SigninPage(),
      ),
    );
  }
}
