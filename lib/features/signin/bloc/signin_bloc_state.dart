part of 'signin_bloc.dart';

enum SigninStatus { initial, loading, success, failure }

final class SigninBlocState extends Equatable {
  const SigninBlocState({
    this.status = SigninStatus.initial,
    this.error = '',
    this.user = const User(
      id: 0,
      email: '',
      firstName: '',
      lastName: '',
      avatar: '',
      token: '',
    ),
  });
  final SigninStatus status;
  final String error;
  final User user;

  SigninBlocState copyWith({
    SigninStatus? status,
    String? error,
    User? user,
  }) {
    return SigninBlocState(
      status: status ?? this.status,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, error, user];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return 'SigninBlocState{status: $status, error: $error, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SigninBlocState &&
        other.status == status &&
        other.error == error &&
        other.user == user;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ user.hashCode;
}
