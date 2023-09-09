import 'package:firebase/service/media_service_interface.dart';
import 'package:firebase/widgets/ui_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePickerActionSheet extends StatelessWidget {
  const ImagePickerActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Row(
            children: [
              Icon(Icons.image, color: AppColors.black.color),
              Text(
                ' Gallery',
                style: TextStyle(
                    color: AppColors.black.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.camera),
        ),
        CupertinoActionSheetAction(
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: AppColors.black.color),
              Text(
                ' Camera',
                style: TextStyle(
                    color: AppColors.black.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.gallery),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancel',
          style: TextStyle(
              color: AppColors.accent.color,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
