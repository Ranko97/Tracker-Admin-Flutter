import 'package:dipl_admin/couriers/couriers_page.dart';
import 'package:dipl_admin/home_screen.dart';
import 'package:dipl_admin/orders/order_details_page.dart';
import 'package:dipl_admin/orders/orders_page.dart';
import 'package:dipl_admin/users/users_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeScreen(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/orders',
          builder: (BuildContext context, GoRouterState state) {
            return const OrdersPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const OrderDetailsPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/couriers',
          builder: (BuildContext context, GoRouterState state) {
            return const CouriersPage();
          },
        ),
        GoRoute(
          path: '/users',
          builder: (BuildContext context, GoRouterState state) {
            return const UsersPage();
          },
        ),
      ],
    ),
  ],
);
