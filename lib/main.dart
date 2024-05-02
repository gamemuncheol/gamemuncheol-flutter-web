// ignore_for_file: constant_identifier_names, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:gamemucheol_was/common/data.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:gamemucheol_was/router/go_router.dart';
import 'package:gamemucheol_was/config/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp.router(routerConfig: goRouter),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String PATH = "/";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "아직 로그인 창이 나타나지 않았나요?",
            ),
          ],
        ),
      ),
    );
  }
}

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({
    super.key,
  });

  static const String PATH = "/redirect";

  @override
  Widget build(BuildContext context) {
    final url = Data.CALLBACK_URL + GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/gamemuncheol_logo.png"),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(url)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "동의: gamemuncheol에\n로그인",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
