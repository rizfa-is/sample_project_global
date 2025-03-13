import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_global/pages/home_page.dart';
import 'package:sample_project_global/utils/methods.dart';

import 'configs/themes.dart';
import 'notifiers/flashcards_notifier.dart';
import 'notifiers/review_notifier.dart';
import 'notifiers/settings_notifier.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashcardsNotifier()),
    ChangeNotifierProvider(create: (_) => SettingsNotifier()),
    ChangeNotifierProvider(create: (_) => ReviewNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updatePreferencesOnRestart(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese Flashcards',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
