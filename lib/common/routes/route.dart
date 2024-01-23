import 'package:dogether/features/auth/pages/login_page.dart';
import 'package:dogether/features/auth/pages/otp_page.dart';
import 'package:dogether/features/dogether/pages/add_list_page.dart';
import 'package:dogether/features/dogether/pages/home_page.dart';
import 'package:dogether/features/dogether/pages/list_page.dart';
import 'package:dogether/features/onboarding/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => OtpPage(),
      ),
      GoRoute(
        path: '/list/:lid',
        builder: (context, state) => ListPage(lid: state.pathParameters['lid']),
      ),
      GoRoute(
        path: '/add_list',
        builder: (context, state) => AddList(),
      )
    ],
  );
});
