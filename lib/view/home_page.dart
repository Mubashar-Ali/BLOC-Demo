import 'package:bloc_demo/bloc/album/album_bloc.dart';
import 'package:bloc_demo/view/album_page.dart';
import 'package:bloc_demo/view/calculator.dart';
import 'package:bloc_demo/view/counter_page.dart';
import 'package:bloc_demo/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CounterPage.routeName),
              child: const Text('Counter Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, TodoPage.routeName),
              child: const Text('Todo List Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AlbumBloc>().add(AlbumsFetchEvent());
                Navigator.pushNamed(context, AlbumPage.routeName);
              },
              child: const Text('Fetch API Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CalculatorPage.routeName),
              child: const Text('Calculator Page'),
            ),
          ],
        ),
      ),
    );
  }
}
