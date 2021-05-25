import 'package:appimc/results.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _resetFields()
  {
      pesoController.text = '';
      alturaController.text = '';
      setState(() {
        _formKey = GlobalKey<FormState>();
      });
  }

  void _calcular(){
    setState(()
    {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / ( altura * altura);
      // print(imc);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Results(imc) ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caluladora IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: pesoController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (CM)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: alturaController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _calcular();
                      }
                    },
                    child: Text('Calcular',style: TextStyle(color: Colors.white, fontSize: 25.0),),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}