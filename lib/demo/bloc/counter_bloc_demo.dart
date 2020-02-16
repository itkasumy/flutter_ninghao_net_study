import 'dart:async';
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        stream: _counterBloc.count,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            child: ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
                // _counterBloc.log();
                _counterBloc.counter.add(2);
              }
            ),
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      }
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;
  
  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count += data;
    _counterController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoC');
  }
}
