import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  static const String routeName = 'ErrorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
        
      ),
      body: Center(
        child: Text(
          'Page Not Found',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
