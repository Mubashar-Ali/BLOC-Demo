import 'dart:async';

import 'package:bloc_demo/bloc/calculator/calculator_event.dart';
import 'package:bloc_demo/bloc/calculator/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<CalculatorNumbersEvent>(numberHandler);
    on<CalculatorOperatorsEvent>(operatorHandler);
    on<CalculatorACEvent>(acHandler);
    on<CalculatorEqualEvent>(equalHandler);
  }

  void numberHandler(
      CalculatorNumbersEvent event, Emitter<CalculatorState> emit) {
    final updatedInput = state.input + event.number;
    emit(state.copyWith(input: updatedInput));
  }

  void delHandler(CalculatorNumbersEvent event, Emitter<CalculatorState> emit) {
    final updatedInput = state.input;
    emit(state.copyWith(input: updatedInput));
  }

  void operatorHandler(
      CalculatorOperatorsEvent event, Emitter<CalculatorState> emit) {
    if (state.input.isEmpty) return;
    final updatedInput = '${state.input} ${event.operator} ';
    emit(state.copyWith(input: updatedInput));
  }

  FutureOr<void> equalHandler(
      CalculatorEqualEvent event, Emitter<CalculatorState> emit) {
    try {
      final result = evalResult(state.input);
      emit(state.copyWith(result: result, input: result));
    } catch (e) {
      emit(CalculatorState(result: 'Error $e', input: ''));
    }
  }

  String evalResult(String input) {
    final tokens = input.split(' ');
    if (tokens.length < 3) return input;

    double num1 = double.parse(tokens[0]);
    String operator = tokens[1];
    double num2 = double.parse(tokens[2]);

    return switch (operator) {
      '+' => (num1 + num2).toInt().toString(),
      '-' => (num1 - num2).toInt().toString(),
      'x' => (num1 * num2).toInt().toString(),
      '÷' => (num2 != 0) ? (num1 / num2).toString() : 'Infinity',
      '%' => (num1 % num2).toString(),
      _ => "Error",
    };
  }

  FutureOr<void> acHandler(
      CalculatorACEvent event, Emitter<CalculatorState> emit) {
    emit(const CalculatorState());
  }
}
