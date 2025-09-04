import 'dart:async';

import 'package:app/presentation/widgets/stream_builder_screen/stream_counter.dart';
import 'package:app/presentation/widgets/stream_builder_screen/stream_error_handler_widget.dart';
import 'package:app/presentation/widgets/stream_builder_screen/stream_status_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StreamBuilderErrorHandlerScreen extends StatefulWidget {
  const StreamBuilderErrorHandlerScreen({super.key});

  @override
  State<StreamBuilderErrorHandlerScreen> createState() =>
      _StreamBuilderErrorHandlerScreenState();
}

class _StreamBuilderErrorHandlerScreenState
    extends State<StreamBuilderErrorHandlerScreen> {
  late Stream<int> _stream = _createStream();

  bool _isActive = true;
  StreamSubscription<int>? _subscription;

  @override
  void initState() {
    super.initState();
    _stream = _createStream();
    _listenToStream();
  }

  Stream<int> _createStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) => i).map((i) {
      if (i == 3) throw Exception('Erro no número 3');
      if (i == 7) throw FormatException('Erro de formato');
      if (i > 10) throw StateError('Stream finalizada');
      return i;
    }).asBroadcastStream();
  }

  void _listenToStream() {
    _subscription?.cancel();

    _subscription = _stream.listen(
      (data) {},
      onError: (error, stackTrace) {
        if (error is StateError) {
          setState(() => _isActive = false);
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _restartStream() {
    setState(() {
      _stream = _createStream();
      _listenToStream();
      _isActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBuilder Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamStatusIndicator(isActive: _isActive),
              Gap(20),
              Expanded(
                child: StreamBuilder<int>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        !snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Gap(16),
                          Text(
                            'Conectando ao stream...',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }

                    if (snapshot.hasError) {
                      return StreamErrorHandlerWidget(
                        error: snapshot.error!,
                        stackTrace: snapshot.stackTrace,
                      );
                    }

                    return StreamCounter(value: snapshot.data!);
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: _restartStream,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar Stream'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
