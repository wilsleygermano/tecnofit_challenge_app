import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_challenge_app/core/constants/app_strings.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/profile/bloc/profile_bloc.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/bottom_bar.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/contact_widget.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/side_bart.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/tweets_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});
  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int _selectedIndex;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.sizeOf(context).width > 600;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0XFFfffff4),
        body: BlocProvider(
          create: (context) => ProfileBloc()
            ..add(
              ProfilePageLoaded(user: widget.user),
            ),
          child: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileBlocState>(
              builder: (context, state) {
                switch (state.status) {
                  case ProfileStatus.success:
                    return Row(
                      children: [
                        if (isDesktop)
                          SideBar(
                            selectedIndex: _selectedIndex,
                            onDestinationSelected: _onDestinationSelected,
                          ),
                        _selectedIndex == 4
                            ? ContactWidget(
                                avatarUrl: state.user.avatar,
                                fullName: state.user.fullName,
                                email: state.user.email,
                                bio: AppStrings.bio,
                                buttonTxt: AppStrings.signOut,
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                        SignOutRequested(context: context),
                                      );
                                })
                            : (_selectedIndex >= 0 && _selectedIndex <= 3)
                                ? TweetsWidget(avatarUrl: state.user.avatar)
                                : throw UnimplementedError()
                      ],
                    );
                  default:
                    return const CircularProgressIndicator.adaptive();
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: isDesktop
            ? null
            : BottomBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
              ),
      ),
    );
  }
}
