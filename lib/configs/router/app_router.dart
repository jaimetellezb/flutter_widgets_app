import 'package:flutter_widgets_app/configs/constants/constants.dart'
    as constants;
import 'package:flutter_widgets_app/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home-screen',
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: constants.buttonScreen,
          path: 'buttons',
          builder: (context, state) => const ButtonScreen(),
        ),
      ],
    ),
  ],
);
