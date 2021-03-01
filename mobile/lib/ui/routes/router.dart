import 'package:auto_route/auto_route_annotations.dart';
import 'package:akrasia/ui/sign_in/sign_in_page.dart';
import 'package:akrasia/ui/splash/splash_page.dart';
import 'package:akrasia/ui/goals/goal_overview_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: GoalOverviewPage),
  ],
  generateNavigationHelperExtension: true,
)
class $AkrasiaRouter {}
