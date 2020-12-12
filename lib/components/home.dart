import 'package:flutter/material.dart';
import 'package:schulte_table/components/schulte_table.dart';
import 'menu_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: ListView(children: <Widget>[
              Center(
                  child: RichText(
                      text: TextSpan(
                text: 'Choose one of the games mode to start',
                style: new TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ))),
              Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    children: List.generate(6, (index) {
                      return Container(child: MenuItem());
                    }),
                  )),
              Container(
                height: 50,
                child: ElevatedButton(
                  child: Text('Open route'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchulteTable()),
                    );
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
