part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

final class ProfileBlocState extends Equatable {
  const ProfileBlocState({
    this.status = ProfileStatus.initial,
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

  final ProfileStatus status;
  final String error;
  final User user;

  ProfileBlocState copyWith({
    ProfileStatus? status,
    String? error,
    User? user,
  }) {
    return ProfileBlocState(
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
    return 'ProfileBlocState{status: $status, error: $error, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileBlocState &&
        other.status == status &&
        other.error == error &&
        other.user == user;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ user.hashCode;
  
}
