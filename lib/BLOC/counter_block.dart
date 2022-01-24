import 'dart:async';
import 'package:blocpatteren/Events/ConterEvent.dart';

class CounterBloc {
  int _counter = 0;

  final _conterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _conterStateController.sink;
  Stream<int> get counter => _conterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get CounterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent e) {
    if (e is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _conterStateController.close();
    _counterEventController.close();
  }
}
