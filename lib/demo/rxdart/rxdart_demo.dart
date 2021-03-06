import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
      // .map((item) => 'item: $item')
      // .where((item) => item.length > 9)
      .debounce(Duration(milliseconds: 500))
      .listen((data) => print(data));

    // Observable<String> _observable =
    //   // Observable(Stream.fromIterable(['Hello', '您好']));
    //   // Observable.fromFuture(Future.value('Hello'));
    //   // Observable.fromIterable(['Hello']);
    //   // Observable.just('Hello');
    //   Observable.periodic(Duration(seconds: 3), (x) => x.toString());

    // _observable.listen(print);

    // ---------------------------

    // PublishSubject<String> _subject = PublishSubject<String>();

    // _subject.listen((data) => print('listen1: $data'));
    // _subject.add('Hello');
    // _subject.listen((data) => print('listen2: ${data.toUpperCase()}'));
    // _subject.add('ye');

    // _subject.close();

    // ---------------------------
    
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();

    // // _subject.listen((data) => print('listen1: $data'));
    // // _subject.add('Hello');
    // // _subject.listen((data) => print('listen2: ${data.toUpperCase()}'));
    // // _subject.add('ye');

    // _subject.add('ye');
    // _subject.add('Hello');
    // _subject.listen((data) => print('listen1: $data'));
    // _subject.listen((data) => print('listen2: ${data.toUpperCase()}'));

    // _subject.close();

    // ---------------------------
    
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    // _subject.add('ye');
    // _subject.add('Hello');
    // _subject.add('Jun');
    // _subject.listen((data) => print('listen1: $data'));
    // _subject.listen((data) => print('listen2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}
