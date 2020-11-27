import 'package:flutter/material.dart';

class AtrasoPensao extends StatefulWidget {
  @override
  _AtrasoPensaoState createState() => _AtrasoPensaoState();
}

Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
class _AtrasoPensaoState extends State<AtrasoPensao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Atraso de Pensão", style: TextStyle(fontSize: 24)),
          centerTitle: true,
          backgroundColor: temaVerde,
        ),
        body: Column(
            children: <Widget>[
              Text("xxxxxxxx", style: TextStyle(fontSize: 30)),

            ]
        )
    );
  }
}
