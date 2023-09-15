import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100 / 2),
                    child: Container(
                        width: 80,
                        height: 80,
                        decoration:
                            BoxDecoration(color: AppColors.background.color),
                        child: Image.network(
                          snapshot.data?.photoURL ??
                              imagesMap[Images.userPhoto]!,
                          fit: BoxFit.cover,
                        ))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?.displayName ??
                            AppLocalizations.of(context)!.userName,
                        style: TextStyle(
                            color: AppColors.white.color, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.followers(1200),
                            style: TextStyle(
                                color: AppColors.white.color, fontSize: 12),
                          ),
                          const Text(
                            "﹒",
                          ),
                          Text(
                            AppLocalizations.of(context)!.subscriptions(0),
                            style: TextStyle(
                                color: AppColors.white.color, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
