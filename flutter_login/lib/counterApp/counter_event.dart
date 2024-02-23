import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_login/counterApp/counter_bloc.dart';
import 'package:flutter_login/counterApp/counter_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {
  Stream<CounterState> applyAsync(
      {CounterState currentState, CounterBloc bloc});
}

class UnCounterEvent extends CounterEvent {
  @override
  Stream<CounterState> applyAsync({CounterState? currentState, CounterBloc? bloc}) async* {
    yield UnCounterState();
  }
}

class LoadCounterEvent extends CounterEvent {
   
  @override
  Stream<CounterState> applyAsync(
      {CounterState? currentState, CounterBloc? bloc}) async* {
    try {
      yield UnCounterState();
      await Future.delayed(const Duration(seconds: 1));
      yield InCounterState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadCounterEvent', error: _, stackTrace: stackTrace);
      yield ErrorCounterState( _.toString());
    }
  }
}
