import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/core/widgets/vertical_spacer.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/app_list_tile.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/avatar_widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.avatarUrl,
    required this.fullName,
    required this.email,
    required this.bio,
    required this.onPressed,
    required this.buttonTxt,
  });
  final String avatarUrl;
  final String fullName;
  final String email;
  final String bio;
  final Function()? onPressed;
  final String buttonTxt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  AvatarWidget(
                    avatarUrl: avatarUrl,
                    size: 200,
                  ),
                  const VerticalSpacer(
                    height: 64,
                  ),
                  AppListTile(
                    title: fullName,
                    leading: const Icon(Icons.person),
                  ),
                  const VerticalSpacer.profile(),
                  AppListTile(
                    title: email,
                    leading: const Icon(Icons.email),
                  ),
                  const VerticalSpacer.profile(),
                  AppListTile(
                    title: bio,
                  ),
                  const VerticalSpacer(
                    height: 64,
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonTxt,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
