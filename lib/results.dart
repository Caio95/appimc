import 'dart:async';

import 'package:flutter/material.dart';

class Results extends StatefulWidget{
  
  double resultado;

    Results(this.resultado);

   @override
    _Result createState() => _Result();
}


class _Result extends State<Results>{
  // String _info = "Informe seus dados.";

    AssetImage resultado(res){
      if(res < 18.6){
        return AssetImage('../assets/abaixo.png');
      } else if(res >= 18.6 && res < 24.9){
        return AssetImage('../assets/ideal.png');
      } else if(res >= 24.9 && res < 29.9){
        return AssetImage('../assets/sobrepeso.png');
      } else if(res >= 29.9 && res < 34.9){
        return AssetImage('../assets/obesidade1.png');
      } else if(res >= 34.9 && res < 39.9){
        return AssetImage('../assets/obesidade2.png');
      } else if(res >= 40){
        return AssetImage('../assets/obesidade3.png');

      }
      return AssetImage('');
    }

    String resultadoDescricao(res) {
      if(res < 18.6){
        return 'Abaixo do Peso (18,5 ou menos) - Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.';
      } else if(res >= 18.6 && res < 24.9){
        return 'Peso Ideal (Entre 18,6 e 24,9) - Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.';
      } else if(res >= 24.9 && res < 29.9){
        return 'Levemente Acima do Peso (Entre 25,0 e 29,9) - Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.';
      } else if(res >= 29.9 && res < 34.9){
        return 'Obesidade Grau I (Entre 30,0 e 34,9) - Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.';
      } else if(res >= 34.9 && res < 39.9){
        return 'Obesidade Grau II (Entre 35,0 e 39,9) - Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.';
      } else if(res >= 40){
        return 'Obesidade Grau III (Acima de 40,0) - Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.';
      }
      return '';
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
              child: Column(
              children: [
                  Image(image: resultado(widget.resultado),),
                  Text("Seu IMC: ${widget.resultado.toStringAsPrecision(3)}", style: TextStyle(fontSize: 20, color: Colors.blue),),
                  Text(resultadoDescricao(widget.resultado), textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
              ],
            )
        ) 
      ); 
    }
}