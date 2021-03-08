import 'package:auto_route/auto_route_annotations.dart';
import 'package:akrasia/ui/sign_in/sign_in_page.dart';
import 'package:akrasia/ui/splash/splash_page.dart';
import 'package:akrasia/ui/goals/goal_overview/goal_overview_page.dart';
import 'package:akrasia/ui/goals/goal_form/goal_form_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: GoalOverviewPage),
    MaterialRoute(page: GoalFormPage, fullscreenDialog: true),
  ],
  generateNavigationHelperExtension: true,
)
class $AkrasiaRouter {}
