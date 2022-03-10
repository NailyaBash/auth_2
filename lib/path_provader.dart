import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 75,
              child: Text(
                'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
              ),
            ),
            SizedBox(height: 75,
              child: Text(
                'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
              ),
            ),
            SizedBox(width: 180, height: 82,
              child: ElevatedButton
                (onPressed: () => _incrementCounter,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46.0),
                  ),
                ),
                child: Text('$_counter'),),
            ),
            SizedBox(width: 180, height: 82),
            SizedBox(width: 180, height: 82,
              child: ElevatedButton
                (onPressed: () => _incrementCounter,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46.0),
                  ),
                ),
                child: Text('$_counter'),),
            ),
          ],
        ),
      ),
    );
  }
}

