class IsolateEvent {}

class IsolateEvent$Calculate extends IsolateEvent {}

class IsolateEvent$UpdateProgress extends IsolateEvent {
  final double progress;

  IsolateEvent$UpdateProgress({required this.progress});
}

class IsolateEvent$Calculated extends IsolateEvent {
  final String piValue;

  IsolateEvent$Calculated({required this.piValue});
}
