import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:defensoria/formulario_helper.dart';
import 'package:defensoria/formulario_2.dart';

class Formulario_1 extends StatefulWidget {
  @override
  _Formulario_1State createState() => _Formulario_1State();
}

class _Formulario_1State extends State<Formulario_1> {
  FormularioHelper fHelper = FormularioHelper();

  List<String> _listaNomes = List();
  final _cNomeCrianca = new TextEditingController();        bool _valNomeCrianca = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Formulário De Solicitação", style: TextStyle(fontSize: 22)),
        centerTitle: true,
        backgroundColor: fHelper.temaVerde,
      ),
      body: SingleChildScrollView( child: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Divider(height: 10, color: Colors.white),
                Text('Informações Do(s) Filho(s)', style: TextStyle(fontSize: 25)),
                Divider(height: 10, color: Colors.white),
                fHelper.buildTextField("Nome Completo", "Nome: ", _cNomeCrianca, TextInputType.text, _valNomeCrianca),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding( padding: EdgeInsets.only(top: 10),
                      child: RaisedButton( child: Text("ADICIONAR", style: TextStyle(fontSize: 18)), textColor: Colors.white, color: fHelper.temaVerde,
                      onPressed: (){
                        if (_cNomeCrianca.text.isEmpty || _cNomeCrianca.text == "") return null;
                          setState(() {
                            _listaNomes.add(_cNomeCrianca.text);
                            _cNomeCrianca.clear();
                          });
                      }
                      ),
                  )
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _listaNomes.length,
                  itemBuilder: (context, index) {
                    return Container( padding: EdgeInsets.only(top: 8),
                      child: Dismissible(
                        key: Key( DateTime.now().millisecondsSinceEpoch.toString()),
                        background: Container(
                          color: Colors.orange,
                          child: Align(
                            alignment: Alignment(-0.85, 0),
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                        direction: DismissDirection.startToEnd,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: Text(_listaNomes[index], style: TextStyle(fontSize: 22))),
                            IconButton(tooltip: "Apagar nome", icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: (){
                                setState(() {
                                  _listaNomes.removeAt(index);
                                });
                              }
                            )
                          ]
                        ),
                        onDismissed: (direction){//APAGAR QUANDO ARRASTA P/ DIREITA
                          setState(() {
                            _listaNomes.removeAt(index);
                          });
                        }
                      )
                    );
                  }
                ),
              ]
            ),
          ),
          Divider(height: 10, color: fHelper.temaVerde),
          Padding( padding: EdgeInsets.only(top: 15)),
          RaisedButton(
              onPressed: () {
                if(_listaNomes.length > 0) {
                    setState(() {
                        for (int i = 0; i < _listaNomes.length; i++) {
                            fHelper.adicionaFilho(_listaNomes[i]);
                        }
                    });
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Formulario_2())
                    );
                 }
              },
              child: Text('PROXIMO', style: TextStyle(fontSize: 22),),
              textColor: Colors.white,
              color: fHelper.temaVerde,
              padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
          ),
          Padding( padding: EdgeInsets.only(top: 25
          ))
        ]
      ))
    );
  }
}
