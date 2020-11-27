import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormularioHelper{
      static final FormularioHelper _instance = FormularioHelper.internal(); //SINGLETOON
      factory FormularioHelper() => _instance;  //SINGLETOON
      FormularioHelper.internal();  //SINGLETOON

      //Color temaVerde = Color.fromRGBO(66, 192, 177, 1);
      Color temaVerde = Color.fromRGBO(0, 130, 94, 1);

      String numeroProcesso = "";

      var  nomeFilhos = [];

      Map<String, dynamic> maeInfo = {
         "nomeMae" : "", "nacionalidadeMae" : "", "estadoCivilMae": "", "profissaoMae": "",
         "rgMae" : "", "cpfMae" : "",  "enderecoMae" : "", "numeroCasaMae" : "", "pontoReferenciaMae": "", "bairroMae" : "", "cidadeMae" : "",
      };

      void resetaCampos(){
          numeroProcesso = "";
          nomeFilhos = [];
          maeInfo = { "nomeMae" : "", "nacionalidadeMae" : "", "estadoCivilMae": "", "profissaoMae": "", "pontoReferenciaMae":"", "rgMae" : "", "cpfMae" : "",  "enderecoMae" : "", "numeroCasaMae" : "", "bairroMae" : "", "cidadeMae" : ""};
      }

      void adicionaFilho(String nomeFilho){
          nomeFilhos.add(nomeFilho);
      }

      void preencheMapMae(String  nomeMae, String nacionalidadeMae, String estadoCivilMae, String profissaoMae,
          String rgMae, String cpfMae, String enderecoMae, String numeroCasaMae, String bairroMae, String cidadeMae){

          maeInfo['nomeMae'] = nomeMae; maeInfo['nacionalidadeMae'] = nacionalidadeMae;  maeInfo['estadoCivilMae'] = estadoCivilMae;
          maeInfo['profissaoMae'] = profissaoMae; maeInfo['rgMae'] = rgMae; maeInfo['cpfMae'] = cpfMae;
          maeInfo['enderecoMae'] = enderecoMae; maeInfo['numeroCasaMae'] = numeroCasaMae; maeInfo['bairroMae'] = bairroMae;
          maeInfo['cidadeMae'] = cidadeMae;
      }

      void preencheMapMaePontoRef(String pontoReferenciaMae) {
          maeInfo['pontoReferenciaMae'] = pontoReferenciaMae;
      }

      bool validaCPF(String cpf){
          if(cpf.length == 14){ //ORIGINAL COM x.x.x-x
              String cpfS = "";
              for(int i = 0; i < 14; i++){//PEGAR DIGITOS
                  if(i != 3 && i != 7 && i != 11){cpfS += cpf[i];}
              }
              cpf = cpfS;
          }

          if(cpf.length != 11){ return false; }

          int v1 = 0;
          for(int i = 0; i < 9; i++){
              v1 += int.parse(cpf[i]) * (i+1);
          }
          v1 = v1 % 11;
          if(v1 == 10){ v1 = 0; }

          int v2 = 0;
          for(int i = 1; i < 9; i++){
              v2 += int.parse(cpf[i]) * (i);
          }
          v2 += v1*9;
          v2 = v2 % 11;
          if(v2 == 10){ v2 = 0; }

          if(v1 == int.parse(cpf[9]) && v2 == int.parse(cpf[10])){ return true;}
          return false;
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
      Widget buildTextFieldM(String label, String prefix, TextEditingController c, TextInputType tit, bool validator, MaskTextInputFormatter mask, {Function f}){
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

      void buildShowDialog(context, String titulo, String mensagem){
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
  }