import 'dart:async';

import 'package:bloc_demo/bloc/counter/counter_event.dart';
import 'package:bloc_demo/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {


  CounterBloc() : super(CounterState(counter: 0)) {
    // on<IncrementCounter>((event, emit) {
    //   emit(CounterState(counter: state.counter + 1));
    // });

    on<IncrementCounter>(increment);
    on<DecrementCounter>(decrement);
  }

  FutureOr<void> increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter + 1));
  }

  FutureOr<void> decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(CounterState(counter: state.counter - 1));
  }

  
}
