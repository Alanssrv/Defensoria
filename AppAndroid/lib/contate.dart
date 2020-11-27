import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';

class Contate extends StatefulWidget {
  @override
  _ContateState createState() => _ContateState();
}

class _ContateState extends State<Contate> {
  FormularioHelper fHelper = FormularioHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contate-nos", style: TextStyle(fontSize: 24)),
          centerTitle: true,
          backgroundColor: fHelper.temaVerde,
        ),
        body: Column(
            children: <Widget>[
              Text("xxxxxxxx", style: TextStyle(fontSize: 30)),

            ]
        )
    );
  }
}
