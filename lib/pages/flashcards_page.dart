import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/app/custom_appbar.dart';
import '../components/flashcards_page/card_1.dart';
import '../components/flashcards_page/card_2.dart';
import '../components/flashcards_page/progress_bar.dart';
import '../configs/constants.dart';
import '../notifiers/flashcards_notifier.dart';
import '../utils/methods.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashcardsNotifier =
          Provider.of<FlashcardsNotifier>(context, listen: false);
      flashcardsNotifier.runSlideCard1();
      flashcardsNotifier.generateAllSelectedWords();
      flashcardsNotifier.generateCurrentWord(context: context);
      SharedPreferences.getInstance().then((prefs) {
        if (prefs.getBool('guidebox') == null) {
          runGuideBox(context: context, isFirst: true);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kAppBarHeight),
            child: CustomAppBar()),
        body: IgnorePointer(
          ignoring: notifier.ignoreTouches,
          child: Stack(
            children: const [
              Align(alignment: Alignment.bottomCenter, child: ProgressBar()),
              Card2(),
              Card1(),
            ],
          ),
        ),
      ),
    );
  }
}
