import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
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
          child: Text(AppLocalizations.of(context)!.confirmButton),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context)!.cancelButton),
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
      title: Text(AppLocalizations.of(context)!.error),
      content: Text(text),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          child: Text(AppLocalizations.of(context)!.okButton),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
