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

final class AlertDismissed extends SigninBlocEvent {
  AlertDismissed();
}
