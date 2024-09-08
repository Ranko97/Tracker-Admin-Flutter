import 'package:dipl_admin/couriers/courier_details_page.dart';
import 'package:dipl_admin/couriers/courier_model.dart';
import 'package:dipl_admin/couriers/couriers_page.dart';
import 'package:dipl_admin/home_screen.dart';
import 'package:dipl_admin/orders/order_add_page.dart';
import 'package:dipl_admin/orders/order_details_page.dart';
import 'package:dipl_admin/orders/order_model.dart';
import 'package:dipl_admin/orders/orders_page.dart';
import 'package:dipl_admin/users/user_details_page.dart';
import 'package:dipl_admin/users/user_model.dart';
import 'package:dipl_admin/users/users_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/couriers',
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
                final order = state.extra! as OrderModel;

                return OrderDetailsPage(order: order);
              },
            ),
            GoRoute(
              path: 'add',
              builder: (BuildContext context, GoRouterState state) {
                return const OrderAddPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/couriers',
          builder: (BuildContext context, GoRouterState state) {
            return const CouriersPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                final courier = state.extra! as CourierModel;

                return CourierDetailsPage(courier: courier);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/users',
          builder: (BuildContext context, GoRouterState state) {
            return const UsersPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                final user = state.extra! as UserModel;

                return UserDetailsPage(user: user);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
