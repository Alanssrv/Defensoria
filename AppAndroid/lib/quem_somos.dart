import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';

class QuemSomos extends StatefulWidget {
  @override
  _QuemSomosState createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
  FormularioHelper fHelper = FormularioHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quem Somos", style: TextStyle(fontSize: 24)),
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
