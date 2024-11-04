abstract class CalculatorEvent {
  const CalculatorEvent();
}

class CalculatorNumbersEvent extends CalculatorEvent {
  final String number;
  const CalculatorNumbersEvent({required this.number});
}

class CalculatorOperatorsEvent extends CalculatorEvent {
  final String operator;
  const CalculatorOperatorsEvent({required this.operator});
}

class CalculatorACEvent extends CalculatorEvent {}

class CalculatorEqualEvent extends CalculatorEvent {}
