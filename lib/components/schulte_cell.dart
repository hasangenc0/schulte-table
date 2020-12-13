import 'package:flutter/material.dart';

class SchulteCell extends StatelessWidget {
  final int value;
  SchulteCell(int value) : this.value = value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));

          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
              left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
              right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
            ),
          ),
          child: Center(
              child: Text(
            value.toString(),
            style: TextStyle(fontSize: 24),
          )),
        ));
  }
}
