import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Annisa',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: StreamHomePage(),
    );
  }
}



class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late StreamSubscription subscription2;
  String values = '';
  late StreamSubscription subscription;
  late StreamTransformer transformer;

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  
void changeColor() async {
  //await for (var eventColor in ColorStream().getColors()) { // (soal4)
  colorStream.getColors().listen((eventColor) { // (soal5)
    setState(() {
      bgColor = eventColor;
    });
  });
}
  @override
  void initState() {
    //super.initState();
    //colorStream = ColorStream();
    //changeColor(); // / (soal4)

    //transformer = StreamTransformer<int, int>.fromHandlers(
    //handleData: (value, sink) {
      //sink.add(value * 10);
    //},
    //handleError: (error, trace, sink) {
      //sink.add(-1);
    //},
    //handleDone: (sink) => sink.close(),
  //); (prak 3)

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();
    subscription = stream.listen((event) {
      setState(() {
        //lastNumber = event; //(soal 9)
        values += '$event - ';
      });
    });

    subscription2 = stream.listen((event) {
      setState(() {
        //lastNumber = event;
        values += '$event - ';
      });
    });

    super.initState();
    subscription.onError((error) {
    setState(() {
      lastNumber = -1;
    });
  });

    subscription.onDone(() {
      print('OnDone was called');
    });
  }

  void stopStream() {
    numberStreamController.close();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void addRandomNumber() {
  Random random = Random();
  int myNum = random.nextInt(10);
  if (!numberStreamController.isClosed) {
  numberStream.addNumberToSink(myNum);
  } else {
    setState(() {
      lastNumber = -1;
    });
  }
  //numberStream.adderror(); // (soal7)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Annisa'),
      ),
      body: SizedBox(
        width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(values),
                Text(lastNumber.toString()),
                ElevatedButton(
                  onPressed: () => addRandomNumber(),
                  child: Text('New Random Number'),
                ),
                ElevatedButton(
                  onPressed: () => stopStream(),
                  child: Text('Stop Subscription'),
                ),
              ],
            ),
          ),
        );
  }
}