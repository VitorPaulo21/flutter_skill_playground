import 'dart:async';
import 'dart:isolate';

import 'package:app/domain/usecases/pi_calculation.dart';
import 'package:app/presentation/blocs/isolate_screen_bloc/isolate_event.dart';
import 'package:app/presentation/blocs/isolate_screen_bloc/isolate_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class IsolateBloc extends Bloc<IsolateEvent, IsolateState> {
  ReceivePort? _receivePort;
  Isolate? _isolate;
  StreamSubscription? _listenSubscription;

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  IsolateBloc() : super(IsolateState$Initial()) {
    on<IsolateEvent$Calculate>(_calculate);
    on<IsolateEvent$UpdateProgress>(_updateProgress);
    on<IsolateEvent$Calculated>(_calculated);
  }

  @override
  Future<void> close() {
    _cleanupIsolate();
    controller.dispose();
    return super.close();
  }

  Future<void> _calculate(
    IsolateEvent$Calculate event,
    Emitter<IsolateState> emit,
  ) async {
    final bool isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    final input = int.parse(controller.text);
    if (input > 9999) {
      Get.showSnackbar(
        const GetSnackBar(
          message:
              'Alerta: altos números de casas decimais podem levar bastante tempo para serem calculados.',
          isDismissible: true,
          duration: Duration(seconds: 3),
        ),
      );
    }

    _cleanupIsolate();

    emit(IsolateState$Calculating(progress: 0.0));

    _receivePort = ReceivePort();
    final sendPort = _receivePort!.sendPort;

    _listenSubscription = _receivePort!.listen((message) {
      add(
        IsolateEvent$UpdateProgress(
          progress: message['current']! / message['total']!,
        ),
      );
    });

    compute<Map<String, dynamic>, String>(_isolateEntry, {
      'sendPort': sendPort,
      'decimals': input,
    }).then((pi) {
      add(IsolateEvent$Calculated(piValue: pi));
      _cleanupIsolate();
    });
  }

  void _updateProgress(
    IsolateEvent$UpdateProgress event,
    Emitter<IsolateState> emit,
  ) {
    emit(IsolateState$Calculating(progress: event.progress));
  }

  void _calculated(IsolateEvent$Calculated event, Emitter<IsolateState> emit) {
    emit(IsolateState$Calculated(piValue: event.piValue));
  }

  void _cleanupIsolate() {
    _listenSubscription?.cancel();
    _receivePort?.close();
    _isolate?.kill(priority: Isolate.immediate);

    _listenSubscription = null;
    _receivePort = null;
    _isolate = null;
  }

  static String _isolateEntry(Map<String, dynamic> params) {
    final SendPort sendPort = params['sendPort'] as SendPort;
    final int decimals = params['decimals'] as int;

    try {
      return PiCalculation.calculatePiChudnovsky(
        decimals,
        progressCallback: (current, total) {
          sendPort.send({'current': current, 'total': total});
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
