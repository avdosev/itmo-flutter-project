import 'package:flutter/material.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/pages/create_order.dart';
import 'package:mpi_front/pages/pages.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ],
      // TODO: вернуть
      // redirect: (state) {
      //   final loggedIn = AuthService.I.isLogged;
      //   final loggingIn = state.location.startsWith('/auth');

      //   if (!loggedIn) return loggingIn ? null : '/auth/not_authed';

      //   // no need to redirect at all
      //   return null;
      // },
      refreshListenable: AuthService.I,
    );

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        title: 'Art of the art',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
