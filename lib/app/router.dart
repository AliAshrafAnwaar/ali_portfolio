import 'package:go_router/go_router.dart';

import '../features/portfolio/view/portfolio_page.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const PortfolioPage(),
      ),
    ],
  );
}
