part of 'signin_bloc.dart';

sealed class SigninBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SigninRequested extends SigninBlocEvent {
  SigninRequested({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}

final class ResetRequested extends SigninBlocEvent {
  ResetRequested();
}

final class ProfilePageRequested extends SigninBlocEvent {
  final BuildContext context;
  final User user;
  ProfilePageRequested({
    required this.context,
    required this.user,
  });
}
