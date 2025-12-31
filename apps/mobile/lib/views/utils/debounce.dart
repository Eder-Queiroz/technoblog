import 'dart:async';

class Debounce {
  final Duration duration;
  Timer? _timer;

  Debounce({required this.duration});

  void call(Function() func) {
    _timer?.cancel();
    _timer = Timer(duration, func);
  }

  void cancel() {
    _timer?.cancel();
  }
}
