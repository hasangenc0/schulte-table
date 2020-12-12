import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'Item',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
