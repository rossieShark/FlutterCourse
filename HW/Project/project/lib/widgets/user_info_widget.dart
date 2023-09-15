import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100 / 2),
              child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(color: AppColors.background.color),
                  child: Image.network(
                    'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png',
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User',
                  style: TextStyle(color: AppColors.white.color, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '0 followers﹒0 subscriptions',
                  style: TextStyle(color: AppColors.white.color, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
