import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
class _FormularioState extends State<Formulario> {
  //CONTROLADORES DOS CAMPOS DE ENTRADA E BOOLEANOS DE VALIDAÇÃO DOS MESMOS
  final _cNomeMae = new TextEditingController();            bool _valNomeMae = true;
  final _cNacionalidadeMae = new TextEditingController();   bool _valNacionalidadeMae = true;
  final _cEstadoCivilMae = new TextEditingController();     bool _valEstadoCivilMae = true;
  final _cProfissaoMae = new TextEditingController();       bool _valProfissaoMae = true;
  final _cRGMae = new TextEditingController();              bool _valRGMae = true;
  final _cCPFMae = new TextEditingController();             bool _valCPFMae = true;
  final _cEnderecoMae = new TextEditingController();        bool _valEnderecoMae = true;
  final _cNumeroCasaMae = new TextEditingController();      bool _valNumeroCasaMae = true;
  final _cPontoReferenciaMae = new TextEditingController(); bool _valPontoReferenciaMae = true;
  final _cBairroMae = new TextEditingController();          bool _valBairroMae = true;
  final _cCidadeMae = new TextEditingController();          bool _valCidadeMae = true;

  final _cNomePai = new TextEditingController();            bool _valNomePai = true;
  final _cNacionalidadePai = new TextEditingController();   bool _valNacionalidadePai = true;
  final _cEstadoCivilPai = new TextEditingController();     bool _valEstadoCivilPai = true;
  final _cProfissaoPai = new TextEditingController();       bool _valProfissaoPai = true;
  final _cRGPai = new TextEditingController();              bool _valRGPai = true;
  final _cCPFPai = new TextEditingController();             bool _valCPFPai = true;
  final _cEnderecoPai = new TextEditingController();        bool _valEnderecoPai = true;
  final _cNumeroCasaPai = new TextEditingController();      bool _valNumeroCasaPai = true;
  final _cPontoReferenciaPai = new TextEditingController(); bool _valPontoReferenciaPai = true;
  final _cBairroPai = new TextEditingController();          bool _valBairroPai = true;
  final _cCidadePai = new TextEditingController();          bool _valCidadePai = true;

  final _cNomeCrianca = new TextEditingController();        bool _valNomeCrianca = true;
  List<String> _listaNomes = List();

  //MASCARAS pubspec => mask_text_input_formatter: ^1.0.6
  final maskCPFMae = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  final maskCPFPai = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  final maskData = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Formulário De Solicitação",
            style: TextStyle(fontSize: 22)),
        centerTitle: true,
        backgroundColor: temaVerde,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Divider(height: 10, color: Colors.white),
            Text('Informações Do(s) Filho(s)', style: TextStyle(fontSize: 25)),
            Divider(height: 10, color: Colors.white),
            buildTextField("Nome Completo", "Nome: ", _cNomeCrianca, TextInputType.text, _valNomeCrianca),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton( child: Text("ADICIONAR", style: TextStyle(fontSize: 18)), textColor: Colors.white, color: temaVerde,
                  onPressed: (){
                    if (_cNomeCrianca.text.isEmpty || _cNomeCrianca.text == "") return null;
                    setState(() {
                      _listaNomes.add(_cNomeCrianca.text);
                      _cNomeCrianca.clear();
                    });
                  }
              ),
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
            Divider(height: 10, color: Colors.white),
            Divider(height: 35, color: temaVerde),

            Divider(height: 10, color: Colors.white),
            Text('Informações Da Mãe', style: TextStyle(fontSize: 25)),
            Divider(height: 10, color: Colors.white),
            buildTextField("Nome Completo Da Mãe", "Nome: ", _cNomeMae, TextInputType.text, _valNomeMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Nacionalidade", "", _cNacionalidadeMae, TextInputType.text, _valNacionalidadeMae),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Estado Civil", "", _cEstadoCivilMae, TextInputType.text, _valEstadoCivilMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Profissão", "", _cProfissaoMae, TextInputType.text, _valProfissaoMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("RG", "", _cRGMae, TextInputType.number, _valRGMae),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF", "", _cCPFMae, TextInputType.number, _valCPFMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Endereço", "Rua: ", _cEnderecoMae, TextInputType.text, _valEnderecoMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Número Da Casa", "Nº: ", _cNumeroCasaMae, TextInputType.number, _valNumeroCasaMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Ponto De Referência", "", _cPontoReferenciaMae, TextInputType.text, _valPontoReferenciaMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Bairro", "", _cBairroMae, TextInputType.text, _valBairroMae),
            Divider(height: 10, color: Colors.white),
            buildTextField("Cidade", "", _cCidadeMae, TextInputType.text, _valCidadeMae),

            Divider(height: 35, color: temaVerde),
            Divider(height: 10, color: Colors.white),
            Text('Informações Do Pai', style: TextStyle(fontSize: 25)),
            Divider(height: 10, color: Colors.white),
            buildTextField("Nome Completo Do Pai", "Nome: ", _cNomePai, TextInputType.text, _valNomePai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Nacionalidade", "", _cNacionalidadePai, TextInputType.text, _valNacionalidadePai),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("Estado Civil", "", _cEstadoCivilPai, TextInputType.text, _valEstadoCivilPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Profissão", "", _cProfissaoPai, TextInputType.text, _valProfissaoPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("RG", "", _cRGPai, TextInputType.number, _valRGPai),
            Divider(height: 10, color: Colors.white),
            buildTextFieldM("CPF", "", _cCPFPai, TextInputType.number, _valCPFPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Endereço", "Rua: ", _cEnderecoPai, TextInputType.text, _valEnderecoPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Número Da Casa", "Nº: ", _cNumeroCasaPai, TextInputType.number, _valNumeroCasaPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Ponto De Referência", "Referência: ", _cPontoReferenciaPai, TextInputType.text, _valPontoReferenciaPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Bairro", "", _cBairroPai, TextInputType.text, _valBairroPai),
            Divider(height: 10, color: Colors.white),
            buildTextField("Cidade", "", _cCidadePai, TextInputType.text, _valCidadePai),

            Divider(height: 35, color: temaVerde),
            RaisedButton(
              onPressed: () {
                setState(() { // SE ALGUM CAMPO ESTIVER VAZIO OU INCOMPLETO, TORNE-O INVALIDO
                 _cNomeMae.text.isEmpty ? _valNomeMae = false : _valNomeMae = true;
                 _cCPFMae.text.length != 14  ? _valCPFMae = false : _valCPFMae = true; // 11 CPF 2 . 1 -
                 _cNomePai.text.isEmpty ? _valNomePai = false : _valNomePai = true;
                 _cCPFPai.text.length != 14  ? _valCPFPai = false : _valCPFPai = true;
                 _cEnderecoPai.text.isEmpty ? _valEnderecoPai = false : _valEnderecoPai  = true;
                 _cNomeCrianca.text.isEmpty ? _valNomeCrianca = false : _valNomeCrianca = true;
                });

                if(_valNomeMae && _valCPFMae  && _valNomePai && _valCPFPai && _valEnderecoPai
                    && _valNomeCrianca){//SE TODOS OS CAMPOS ESTIVEREM CORRETOS
                  _showDialog(context, "", "Formulário enviado com sucesso.");
                }else{
                  _showDialog(context, "Campos Incorretos", "Alguns campos não foram preenchidos corretamente, reinforme os campos destacados.");
                }
              },
              child: Text('Enviar Formulario', style: TextStyle(fontSize: 22),),
              textColor: Colors.white,
              color: temaVerde,
              padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
            )
          ],
        )
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, {Function f}){
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      prefixText: prefix,
      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: temaVerde)),
      focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
      errorText: !validator ? "Informe uma entrada válida" : null,
    ),
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    onChanged: f,
    keyboardType: tit,
  );
}

//PASSANDO A MÁSCARA
Widget buildTextFieldM(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, {MaskTextInputFormatter mask, Function f}){
  return TextField(
    scrollPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
    controller: c,
    inputFormatters: [mask],
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: temaVerde)),
        focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.orange)),
        errorText: !validator ? "Informe uma entrada válida" : null,
    ),
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    onChanged: f,
    keyboardType: tit,
  );
}

void _showDialog(context, String titulo, String mensagem){
    Color corFundo; //COR DE FUNDO MUDA DE ACORDO COM O ESTADO AZUL -> OK / LARANJA -> !OK
    titulo == "" ? corFundo = temaVerde : corFundo = Color.fromARGB(255, 247, 149, 0);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: corFundo,
          title: Text(titulo, style: TextStyle(fontSize: 22, color: Colors.white), textAlign: TextAlign.center),
          content: Text(mensagem, style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.justify,),
          actions: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              textColor: corFundo,
              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Text("OK", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

