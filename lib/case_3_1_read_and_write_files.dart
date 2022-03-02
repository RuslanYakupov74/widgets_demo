import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading and writing files',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage{
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;

  }
  Future<File> get _localFile async {
    final path= await _localPath;
    return File('$path/counter.txt');

  }
  Future<int> readCounter() async{
    try{
      final file= await _localFile;
      final contents= await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }
  Future<File> writeCounter(int counter) async{
    final file= await _localFile;
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
  int _counter1 = 0;
  int _counter2 = 0;

  @override
  void initState(){
    super.initState();
    widget.storage.readCounter().then((int value){
      setState(() {
        _counter1=value;
        _counter2=value;
        });
    });
  }
  Future<File> _incrementCounter1(){
    setState(() {
      _counter1++;
    });
    return widget.storage.writeCounter(_counter1);
  }
  Future<File> _incrementCounter2(){
    setState(() {
      _counter2++;
    });
    return widget.storage.writeCounter(_counter2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and writing files'),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter1',
            style: Theme.of(context).textTheme.headline5,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter1,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 50,),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter2',
            style: Theme.of(context).textTheme.headline5,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter2,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}