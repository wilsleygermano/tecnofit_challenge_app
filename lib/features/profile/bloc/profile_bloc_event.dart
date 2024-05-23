part of 'profile_bloc.dart';

sealed class ProfileBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProfilePageLoaded extends ProfileBlocEvent {
  ProfilePageLoaded({
    required this.user,
  });
  final User user;
}

final class SignOutRequested extends ProfileBlocEvent {
  SignOutRequested({
    required this.context,
  });
  final BuildContext context;
}
