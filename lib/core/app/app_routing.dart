import 'package:go_router/go_router.dart';
import 'package:media_design_expert_task/Features/home/presentation/views/home_screen.dart';
import 'package:media_design_expert_task/core/app/routes.dart';

import '../constant/constant.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
