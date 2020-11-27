import 'package:flutter/material.dart';
import 'package:defensoria/tela_inicial.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
