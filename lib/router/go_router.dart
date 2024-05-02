import 'package:gamemucheol_was/common/data.dart';
import 'package:gamemucheol_was/common/web.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gamemucheol_was/main.dart';

GoRouter goRouter = GoRouter(
  initialLocation: HomeScreen.PATH,
  redirect: (context, state) async {
    if (state.matchedLocation == HomeScreen.PATH) {
      await launchUrl(
        Uri.parse(Data.OAUTH_URL),
        webOnlyWindowName: WebName.self.name,
      );
    } else if (state.matchedLocation == RedirectScreen.PATH) {
      await launchUrl(
        Uri.parse("${Data.CALLBACK_URL}${state.uri.toString()}"),
        webOnlyWindowName: WebName.self.name,
      );
    }

    return null;
  },
  routes: [
    GoRoute(
      path: HomeScreen.PATH,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RedirectScreen.PATH,
      builder: (context, state) => const RedirectScreen(),
    ),
  ],
);
