import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  CounterState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnCounterState extends CounterState {

  UnCounterState();

  @override
  String toString() => 'UnCounterState';
}

/// Initialized
class InCounterState extends CounterState {
  InCounterState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InCounterState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorCounterState extends CounterState {
  ErrorCounterState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorCounterState';

  @override
  List<Object> get props => [errorMessage];
}
