// import 'dart:async';
import 'dart:developer' as developer;

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_login/counterApp/counter_event.dart';
import 'package:flutter_login/counterApp/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc(CounterState initialState) : super(initialState){
   on<CounterEvent>((event, emit) {
      return emit.forEach<CounterState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'CounterBloc', error: error, stackTrace: stackTrace);
          return ErrorCounterState(error.toString());
        },
      );
    });
  }
}
