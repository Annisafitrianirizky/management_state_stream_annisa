import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
        }
      );
    }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close () {
    controller.close();
  }

  adderror() {
    controller.sink.addError('error');
  }
}

