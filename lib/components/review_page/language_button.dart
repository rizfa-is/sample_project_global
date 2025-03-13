import 'package:flutter/material.dart';
import '../../enums/language_type.dart';
import '../../notifiers/review_notifier.dart';
import '../../utils/methods.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    required this.languageType,
    this.isDisabled = false,
    Key? key,
  }) : super(key: key);

  final LanguageType languageType;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
          onPressed: isDisabled
              ? null
              : () {
                  Provider.of<ReviewNotifier>(context, listen: false)
                      .updateShowLanguage(language: languageType);
                },
          child: Text(languageType.toSymbol())),
    ));
  }
}
