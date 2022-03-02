import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPresScreen extends StatelessWidget {
  const SharedPresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Shared preferences demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;

  @override
  void initState(){
    super.initState();
    _loadCounter1();
    _loadCounter2();
  }
  void _loadCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter1);
    });
  }

  void _loadCounter2() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter2 = (prefs.getInt('counter2') ?? 0);
    });
  }
  void _incrementCounter2() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter2 = (prefs.getInt('counter2') ?? 0) + 1;
      prefs.setInt('counter2', _counter2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
