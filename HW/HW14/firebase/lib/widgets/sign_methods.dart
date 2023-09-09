import 'package:firebase/widgets/index.dart';
import 'package:firebase/widgets/ui_properties.dart';
import 'package:flutter/cupertino.dart';

class SignMethods extends StatelessWidget {
  final VoidCallback onGoogleTap;

  const SignMethods({super.key, required this.onGoogleTap});
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onGoogleTap,
            child: SizedBox(
                width: 18,
                height: 18,
                child: Image.asset(
                  imagesMap[Images.googleIcon]!,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 7,
          ),
          SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                imagesMap[Images.facebookIcon]!,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              imagesMap[Images.appleIcon]!,
              color: AppColors.white.color,
              fit: BoxFit.cover,
            ),
          ),
        ]);
  }
}
