import 'package:flutter_widgets_app/configs/configs.dart';
import 'package:flutter_widgets_app/screens/screens.dart';
import 'package:flutter_widgets_app/screens/snackbar_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RouteProperties.homeScreen.name,
      path: RouteProperties.homeScreen.path,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: RouteProperties.buttonScreen.name,
          path: RouteProperties.buttonScreen.path,
          builder: (context, state) => const ButtonScreen(),
        ),
        GoRoute(
          name: RouteProperties.floatingButtonScreen.name,
          path: RouteProperties.floatingButtonScreen.path,
          builder: (context, state) => const FloatingButtonScreen(),
        ),
        GoRoute(
          name: RouteProperties.iconButtonScreen.name,
          path: RouteProperties.iconButtonScreen.path,
          builder: (context, state) => const IconButtonScreen(),
        ),
        GoRoute(
          name: RouteProperties.segmentedButtonScreen.name,
          path: RouteProperties.segmentedButtonScreen.path,
          builder: (context, state) => const SegmentedButtonScreen(),
        ),
        GoRoute(
          name: RouteProperties.progressIndicatorScreen.name,
          path: RouteProperties.progressIndicatorScreen.path,
          builder: (context, state) => const ProgressIndicatorScreen(),
        ),
        GoRoute(
          name: RouteProperties.badgeScreen.name,
          path: RouteProperties.badgeScreen.path,
          builder: (context, state) => const BadgeScreen(),
        ),
        GoRoute(
          name: RouteProperties.snackBarScreen.name,
          path: RouteProperties.snackBarScreen.path,
          builder: (context, state) => const SnackBarScreen(),
        ),
        GoRoute(
          name: RouteProperties.bottomSheetScreen.name,
          path: RouteProperties.bottomSheetScreen.path,
          builder: (context, state) => const BottomSheetScreen(),
        ),
        GoRoute(
          name: RouteProperties.alertDialogScreen.name,
          path: RouteProperties.alertDialogScreen.path,
          builder: (context, state) => const AlertDialogScreen(),
        ),

        GoRoute(
          name: RouteProperties.cardScreen.name,
          path: RouteProperties.cardScreen.path,
          builder: (context, state) => const CardScreen(),
        ),
        //END
      ],
    ),
  ],
);
