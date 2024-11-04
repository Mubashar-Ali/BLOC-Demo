import 'package:bloc_demo/bloc/album/album_bloc.dart';
import 'package:bloc_demo/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_demo/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo/bloc/todo/todo_bloc.dart';
import 'package:bloc_demo/view/album_page.dart';
import 'package:bloc_demo/view/calculator.dart';
import 'package:bloc_demo/view/counter_page.dart';
import 'package:bloc_demo/view/error_page.dart';
import 'package:bloc_demo/view/home_page.dart';
import 'package:bloc_demo/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => AlbumBloc()),
        BlocProvider(create: (context) => CalculatorBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.teal.shade800,
            onPrimary: Colors.white,
            secondary: Colors.amber.shade700,
            onSecondary: Colors.white,
            surface: Colors.white,
            error: Colors.red.shade600,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFE8F5E9),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1B5E20),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B5E20),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF1B5E20),
              foregroundColor: Colors.white,
              splashColor: Colors.black38),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Color(0xFF1B5E20),
            contentTextStyle: TextStyle(color: Color(0xFFE8F5E9)),
          )),
      initialRoute: HomePage.routeName,
      // initialRoute: StudentFormPage.routeName,
      onGenerateRoute: _route,
    );
  }

  Route? _route(RouteSettings settings) {
    return switch (settings.name) {
      HomePage.routeName =>
        MaterialPageRoute(builder: (context) => const HomePage()),
      CounterPage.routeName =>
        MaterialPageRoute(builder: (context) => const CounterPage()),
      TodoPage.routeName =>
        MaterialPageRoute(builder: (context) => const TodoPage()),
      AlbumPage.routeName =>
        MaterialPageRoute(builder: (context) => const AlbumPage()),
      CalculatorPage.routeName =>
        MaterialPageRoute(builder: (context) => const CalculatorPage()),
      _ => MaterialPageRoute(builder: (context) => const ErrorPage()),
    };
  }
}
