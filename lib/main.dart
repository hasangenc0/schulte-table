import 'package:flutter/material.dart';
import 'package:schulte_table/components/home.dart';
import 'package:schulte_table/components/menu_item.dart';

void main() {
  runApp(MaterialApp(
      title: 'Schulte Table App',
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      home: Home()));
}

class MyApp extends StatelessWidget {
  // root application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schulte Table App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Schulte Table'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 250,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(6));

  List<Container> _buildGridTileList(int count) =>
      List.generate(count, (i) => Container(child: MenuItem()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(child: _buildGrid()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
