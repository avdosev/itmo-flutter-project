import 'package:flutter/material.dart';
import 'package:mpi_front/pages/home.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Art of the art',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
