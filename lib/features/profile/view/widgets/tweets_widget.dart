import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/core/constants/tweets.dart';
import 'package:tecnofit_challenge_app/core/widgets/vertical_spacer.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/app_list_tile.dart';
import 'package:tecnofit_challenge_app/features/profile/view/widgets/avatar_widget.dart';

class TweetsWidget extends StatelessWidget {
  const TweetsWidget({
    super.key,
    required this.avatarUrl,
  });
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: Tweets.tweets.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const VerticalSpacer.profile(),
              AppListTile(
                title: Tweets.tweets[index],
                leading: AvatarWidget(
                  avatarUrl: avatarUrl,
                ),
              ),
              const VerticalSpacer.profile(),
            ],
          );
        },
      ),
    );
  }
}
