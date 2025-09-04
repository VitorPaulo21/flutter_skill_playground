import 'package:app/presentation/blocs/counter_bloc/counter_events.dart';
import 'package:app/presentation/blocs/counter_bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({final CounterState? initialState})
    : super(initialState ?? CounterState(0)) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
  }

  Future<void> _increment(Increment event, Emitter<CounterState> emit) async {
    emit(CounterState(state.count + 1));
  }

  Future<void> _decrement(Decrement event, Emitter<CounterState> emit) async {
    if (state.count > 0) {
      emit(CounterState(state.count - 1));
    }
  }
}
