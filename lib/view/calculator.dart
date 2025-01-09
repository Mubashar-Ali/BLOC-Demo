import 'package:bloc_demo/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_demo/bloc/calculator/calculator_event.dart';
import 'package:bloc_demo/bloc/calculator/calculator_state.dart';
import 'package:bloc_demo/utils/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  static const String routeName = 'CalculatorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .33,
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          state.input,
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 34),
                        ),
                        Text(
                          state.result,
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(
            // height: 0,s
            indent: 10,
            endIndent: 10,
            thickness: 1.5,
            color: Colors.black26,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                // return (index + 1) % 4 == 0
                //     ? MyButton(txt: buttons[index])
                //     : MyActionButton(txt: buttons[index]);
                return GestureDetector(
                  onTap: () {
                    final bloc = context.read<CalculatorBloc>();
                    final button = buttons[index];
                    if (button == 'AC') {
                      bloc.add(CalculatorACEvent());
                    } else if (button == '=') {
                      bloc.add(CalculatorEqualEvent());
                    } else if ('+-x÷%'.contains(button)) {
                      bloc.add(CalculatorOperatorsEvent(operator: button));
                    } else {
                      bloc.add(CalculatorNumbersEvent(number: button));
                    }
                  },
                  child: MyButton(txt: buttons[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final buttons = [
  'AC',
  'C',
  '%',
  '÷',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '00',
  '.',
  '=',
];
