import 'package:defensoria/atraso_pensao_1.dart';
import 'package:defensoria/contate.dart';
import 'package:defensoria/quem_somos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:defensoria/formulario.dart';
import 'package:defensoria/formulario_1.dart';
import 'package:defensoria/formulario_helper.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

//Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
class _TelaInicialState extends State<TelaInicial> {
  FormularioHelper fHelper = FormularioHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Defensoria Pública", style: TextStyle(fontSize: 30)),
          centerTitle: true, backgroundColor: fHelper.temaVerde,
        ),
        body: SingleChildScrollView(  padding: EdgeInsets.all(15), child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //X (PREENCHER O MAXIMO NA LARGURA DOS BTN)
            children: <Widget>[
              Image(image: AssetImage("images/defensoriaPublicaLogo.png")),
              Divider(height: 20, color: Colors.white),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Solicitar Pensão", style: TextStyle(fontSize: 26)),
                textColor: Colors.white, color: fHelper.temaVerde,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Formulario_1()));
                },
              ),
              Divider(height: 10, color: Colors.white),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Atraso de Pensão", style: TextStyle(fontSize: 26)),
                textColor: Colors.white, color: fHelper.temaVerde,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Atraso_Pensao_1()));
                },
              ),
              Divider(height: 10, color: Colors.white),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Contate-nos", style: TextStyle(fontSize: 26)),
                textColor: Colors.white, color: fHelper.temaVerde,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contate()));
                },
              ),
              Divider(height: 10, color: Colors.white),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Sobre", style: TextStyle(fontSize: 26)),
                textColor: Colors.white, color: fHelper.temaVerde,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuemSomos()));
                },)
            ]
          )
        )
    );
  }
}
