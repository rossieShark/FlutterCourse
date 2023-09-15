import 'package:flutter/cupertino.dart';

class AppAlertDialog extends StatelessWidget {
  final Function onConfirm;
  final String title;
  final String subtitle;

  const AppAlertDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () => onConfirm(),
          child: const Text('Confirm'),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

class SignAlert extends StatelessWidget {
  final String text;

  const SignAlert({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text(text),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
