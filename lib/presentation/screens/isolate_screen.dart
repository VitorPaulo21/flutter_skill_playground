import 'package:app/presentation/blocs/isolate_screen_bloc/isolate_bloc.dart';
import 'package:app/presentation/blocs/isolate_screen_bloc/isolate_event.dart';
import 'package:app/presentation/blocs/isolate_screen_bloc/isolate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PiCalculationScreen extends StatelessWidget {
  final IsolateBloc bloc = IsolateBloc();

  PiCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate Screen')),
      body: BlocBuilder<IsolateBloc, IsolateState>(
        bloc: bloc,
        builder: (context, state) {
          final bool isCalculating = state is IsolateState$Calculating;
          final bool isCalculated = state is IsolateState$Calculated;

          final double progress = isCalculating
              ? state.progress
              : isCalculated
              ? 1.0
              : 0.0;

          final String piValue = isCalculated ? state.piValue : '';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: bloc.formKey,
              child: Column(
                children: [
                  Text(
                    "Esta calculadora te dará o resultado de Pi (π), basta inserir o número de casas decimais desejadas e clicar em calcular 😉.",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(25),
                  TextFormField(
                    controller: bloc.controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Numero de casas decimais',
                      hintText: 'Entre um numero (ex: 100, 1000, 100000)',
                    ),
                    enabled: !isCalculating,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Este campo é obrigatório";
                      }
                      return null;
                    },
                  ),
                  Gap(16),
                  ElevatedButton(
                    onPressed: isCalculating
                        ? null
                        : () => bloc.add(IsolateEvent$Calculate()),
                    child: const Text('Calcular'),
                  ),
                  Gap(16),
                  Row(
                    children: [
                      Expanded(child: LinearProgressIndicator(value: progress)),
                      if (isCalculating || piValue.isNotEmpty) Gap(15),
                      if (isCalculating || piValue.isNotEmpty)
                        Text(
                          "${(progress * 100).toStringAsFixed(2)} %",
                          style: GoogleFonts.kodeMono(),
                        ),
                    ],
                  ),
                  Gap(16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            piValue.isNotEmpty
                                ? piValue
                                : 'Result will appear here',
                            style: GoogleFonts.kodeMono(),
                          ),
                          if (piValue.isEmpty) Gap(20),
                          if (piValue.isEmpty)
                            SizedBox.square(
                              dimension: 400,
                              child: Image.asset("assets/calculadora.png"),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
