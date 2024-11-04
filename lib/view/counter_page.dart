import 'package:bloc_demo/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo/bloc/counter/counter_event.dart';
import 'package:bloc_demo/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  static const String routeName = 'CounterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return OverflowBar(
            spacing: 10,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementCounter()),
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'remove',
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementCounter()),
                child: const Icon(Icons.remove),
              ),
            ],
          );
        },
      ),
    );
  }
}
