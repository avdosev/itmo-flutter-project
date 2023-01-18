import 'package:flutter/material.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/pages/create_information.dart';
import 'package:mpi_front/pages/create_order.dart';
import 'package:mpi_front/pages/orders.dart';
import 'package:mpi_front/pages/pages.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/auth/not_authed',
      builder: (context, state) => const NotAuthed(),
    ),
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/auth/register',
      builder: (context, state) => const Register(),
    ),
    GoRoute(
      path: '/order/create',
      builder: (context, state) => const CreateOrder(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersPage(),
    ),
    GoRoute(
      path: '/orders/available',
      builder: (context, state) => const OrdersAvailablePage(),
    ),
    GoRoute(
      path: '/order/:order_id',
      builder: (context, state) => OrderPage(
        orderId: Identifier.fromString(state.params['order_id']!),
      ),
    ),
    GoRoute(
      path: '/informations',
      builder: (context, state) => const InformationsPage(),
    ),
    GoRoute(
      path: '/informations/available',
      builder: (context, state) => const InformationsAvailablePage(),
    ),
    GoRoute(
      path: '/information/create',
      builder: (context, state) => CreateInformation(),
    ),
    GoRoute(
      path: '/information/:id',
      builder: (context, state) => InformationPage(
        informationId: Identifier.fromString(state.params['id']!),
      ),
    ),
    GoRoute(
      path: '/weapon',
      builder: (context, state) => const WeaponsPage(),
    ),
    GoRoute(
      path: '/weapon/available',
      builder: (context, state) => const WeaponsAvailablePage(),
    ),
    GoRoute(
      path: '/weapon/create',
      builder: (context, state) => CreateWeapon(),
    ),
    GoRoute(
      path: '/weapon/:id',
      builder: (context, state) => WeaponPage(
        weaponId: Identifier.fromString(state.params['id']!),
      ),
    ),
    GoRoute(
      path: '/artifacts',
      builder: (context, state) => const ArtifactsPage(),
    ),
  ],
  // TODO: вернуть
  redirect: (state) {
    print('redirect');
    final loggedIn = AuthService.I.isLogged;
    final loggingIn = state.location.startsWith('/auth');

    if (!loggedIn && !loggingIn) return '/auth/not_authed';
    if (loggedIn && loggingIn) return '/';
    // no need to redirect at all
    return null;
  },
  refreshListenable: AuthService.I,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        title: 'Art of the art',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: EdgeInsets.all(16),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              padding: EdgeInsets.all(16),
            ),
          ),
          listTileTheme: ListTileThemeData(
            iconColor: Colors.black,
          ),
        ),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
