import 'package:app/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:app/presentation/blocs/counter_bloc/counter_events.dart';
import 'package:app/presentation/blocs/counter_bloc/counter_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testes no CounterBloc", () {
    blocTest<CounterBloc, CounterState>(
      'deve incrementar e emitir CounterState(1)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Increment()),
      expect: () => [CounterState(1)],
    );

    blocTest<CounterBloc, CounterState>(
      'deve decrescer o contador e emitir CounterState(0)',
      build: () => CounterBloc(initialState: CounterState(1)),
      act: (bloc) => bloc.add(Decrement()),
      expect: () => [CounterState(0)],
    );
  });
}
