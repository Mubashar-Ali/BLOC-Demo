class CalculatorState {
  final String input;
  final String result;

  const CalculatorState({this.input = '', this.result = '0'});

  CalculatorState copyWith({String? input, String? result}) {
    return CalculatorState(
      input: input ?? this.input,
      result: result ?? this.result,
    );
  }
}
