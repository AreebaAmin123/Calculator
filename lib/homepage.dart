import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputController=TextEditingController();
  TextEditingController resultController=TextEditingController();
  void  calculate(value){
    try{
      switch(value){
        case 'AC':
          inputController.clear();
          resultController.clear();
          break;
        case 'DEL':
          if(inputController.text.isNotEmpty){
            inputController.text= inputController.text.substring(0,inputController.text.length-1);
          }
          break;
        case 'X':
          inputController.text +='*';
          break;
        case '=':
          if(inputController.text.isNotEmpty){
            Parser perser=Parser();
            Expression expression=perser.parse(inputController.text);
            ContextModel context=ContextModel();
            var  total=expression.evaluate(EvaluationType.REAL, context);
            resultController.text=total.toString();
          }
          break;
        default:
          inputController.text+=value;
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: Column(
          children: [
            const  SizedBox(height: 120,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: inputController,
                  style:const TextStyle(fontSize: 70),
                  textAlign: TextAlign.right,
                  readOnly: true,
                  showCursor: true,
                  cursorWidth: 3,
                  cursorHeight: 50,
                  decoration:const InputDecoration(
                      border: InputBorder.none
                  ),
                ),
                TextFormField(
                  controller: resultController,
                  textAlign: TextAlign.right,
                  style:const TextStyle(fontSize: 55,),
                  readOnly: true,
                  decoration:const InputDecoration(
                      border: InputBorder.none
                  ),
                ),
              ],
            ),
            const  SizedBox(height:30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: 'AC',bColor: Colors.blue.shade600, tColor: Colors.white,fsize: 23),
                button(text: 'DEL',bColor: Colors.blue.shade600, tColor: Colors.white,fsize: 23),
                button(text: '%',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 34),
                button(text: '/',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 29),

              ],
            ),
            const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '1',fsize: 25,bColor: Colors.blueGrey),
                button(text: '2',fsize: 25,bColor: Colors.blueGrey),
                button(text: '3',fsize: 25,bColor: Colors.blueGrey),
                button(text: '*',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 37),

              ],
            ),
            const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '4',fsize: 25,bColor: Colors.blueGrey),
                button(text: '5',fsize: 25,bColor: Colors.blueGrey),
                button(text: '6',fsize: 25,bColor: Colors.blueGrey),
                button(text: '+',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 32),

              ],
            ),
            const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '7',fsize: 25,bColor: Colors.blueGrey),
                button(text: '8',fsize: 25,bColor: Colors.blueGrey),
                button(text: '9',fsize: 25,bColor: Colors.blueGrey),
                button(text: '-',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 32),

              ],
            ),
            const  SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(text: '.',fsize: 29,bColor: Colors.blueGrey),
                button(text: '0',fsize: 23,bColor: Colors.blueGrey),
                button(text: '00',fsize: 23,bColor: Colors.blueGrey),
                button(text: '=',bColor: Colors.orange.shade700, tColor: Colors.white,fsize: 32),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget button({text, Color bColor = Colors.white, Color tColor = Colors.black, double fsize = 20}) {
    return InkWell(
      onTap: () {
        calculate(text);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bColor,
          boxShadow: [BoxShadow(color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 5)],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: tColor, fontSize: fsize, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
