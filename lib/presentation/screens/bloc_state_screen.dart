import 'package:app/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:app/presentation/blocs/counter_bloc/counter_events.dart';
import 'package:app/presentation/blocs/counter_bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocStateScreen extends StatelessWidget {
  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Screen')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: ValueKey('increment'),
            heroTag: 'increment',
            onPressed: () {
              bloc.add(Increment());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            key: ValueKey('decrement'),
            heroTag: 'decrement',
            onPressed: () {
              bloc.add(Decrement());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.count.toString(),
                  style: TextStyle(
                    fontSize: 80,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Counter",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
