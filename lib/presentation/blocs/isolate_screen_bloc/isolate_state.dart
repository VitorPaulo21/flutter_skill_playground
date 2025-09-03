import 'package:equatable/equatable.dart';

class IsolateState extends Equatable {
  final double progress;
  final String piValue;

  const IsolateState({this.progress = 0, this.piValue = ''});

  @override
  List<Object?> get props => [progress, piValue];
}

class IsolateState$Initial extends IsolateState {
  const IsolateState$Initial() : super();
}

class IsolateState$Calculating extends IsolateState {
  const IsolateState$Calculating({required super.progress});
}

class IsolateState$Calculated extends IsolateState {
  const IsolateState$Calculated({required super.piValue});
}
