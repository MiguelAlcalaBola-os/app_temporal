import 'dart:developer' as developer;

void log(Object message) {
  final trace = StackTrace.current;
  final frames = trace.toString().split('\n');
  final relevantFrame =
      frames.length > 1 ? frames[1] : 'No stack trace available';
  developer.log('$message\nStackTrace: $relevantFrame');
}
