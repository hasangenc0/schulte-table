import 'package:flutter/material.dart';
import 'package:schulte_table/components/home.dart';

class SchulteTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schulte Table'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
    );
  }
}
