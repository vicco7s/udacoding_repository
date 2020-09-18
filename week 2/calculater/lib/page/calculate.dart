import 'package:calculater/constant/constanta.dart';
import 'package:calculater/constant/finaly.dart';
import 'package:flutter/material.dart';

class HomeCalculate extends StatefulWidget {
  @override
  _HomeCalculateState createState() => _HomeCalculateState();
}

class _HomeCalculateState extends State<HomeCalculate> {
  String textButton ;
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  

tomboldua(String textButton) {

  if(textButton == "Ac"){
      
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";

    } else if (textButton == "+" || textButton == "-" || textButton == "/" || textButton == "*"){

      num1 = double.parse(output);

      operand = textButton;

      _output = "0";

    } else if(textButton == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + textButton;
      }

    } else if (textButton == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";

    } else {

      _output = _output + textButton;

    }

    setState(() {
      
      output = double.parse(_output).toStringAsFixed(1);

    });

  
}


// ignore: non_constant_identifier_names
Widget NumButton(String textButton) {
    return Container(
        child: InkWell(
          onTap: (){
            tomboldua(textButton);
          },
          child: Container(
          padding: kSizeButton,
         decoration: kCulateButton,
           child:  Text(textButton,style: kTextButton,),
          ) 
         ),
      ); 
  }
// ignore: non_constant_identifier_names
Widget TombolButton(String textButton) {
  return Container(
                   child: InkWell(
                     onTap: (){
                       tomboldua(textButton);
                     },
                     child: Container(
                     padding: kSizeButton,
                      child: Text(textButton,style: kTextButton,),
                     ) 
                    ),
                 ); 
} 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                   output,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 70
                     ), 
                  ),
                ],
              ) 
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
                Container(
                  child: InkWell(
                    onTap: (){
                      tomboldua('+');
                    },
                   child: Container(
                     padding: EdgeInsets.all(15),
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Color(0xFF1da1f2),
                       borderRadius: BorderRadius.circular(50)
                     ),
                     child: Text('+',
                      style: kCulateText,
                      textAlign: TextAlign.center,
                      ), 
                    ),
                  ),
                ),

                Container(
                  child: InkWell(
                    onTap: (){
                      tomboldua('-');
                    },
                   child: Container(
                     padding: EdgeInsets.all(15),
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Color(0xFF8884ed),
                       borderRadius: BorderRadius.circular(50)
                     ),
                     child: Text('-',
                      style: kCulateText,
                      textAlign: TextAlign.center,
                      ), 
                    ), 
                  ),
                ),

                Container(
                  child: InkWell(
                    onTap: (){
                      tomboldua('*');
                    },
                   child: Container(
                     padding: EdgeInsets.all(15),
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Color(0xFFf36b7f),
                       borderRadius: BorderRadius.circular(50)
                     ),
                     child: Text('x',
                      style: kCulateText2,
                      textAlign: TextAlign.center,
                      ),  
                    )
                  ),
                ),

                Container(
                  child: InkWell(
                    onTap: (){
                      tomboldua('/');
                    },
                   child: Container(
                     padding: EdgeInsets.all(15),
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Color(0xFF32db99),
                       borderRadius: BorderRadius.circular(50)
                     ),
                     child: kCulateImage,)
                  ),
                ),

                Container(
                  child: InkWell(
                    onTap: (){
                      tomboldua('Ac');
                    },
                   child: Container(
                     padding: EdgeInsets.all(15),
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Color(0xFFffce05),
                       borderRadius: BorderRadius.circular(50)
                     ),
                     child: Center(
                       child: Icon(
                        Icons.backspace,color: Colors.black, 
                       ),
                     )), 
                  ),
                ),       
             ], 
            ),

            SizedBox(height: 20,), // line
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[   
                 NumButton('1'),
                 NumButton('2'),
                 NumButton('3'),
               ], 
              ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[   
               NumButton('4'),
               NumButton('5'),
               NumButton('6'),
             ], 
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[   
               NumButton('7'),
               NumButton('8'),
               NumButton('9'), 
             ], 
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[   
                 TombolButton('='),
                 NumButton('0'),
                 SizedBox(width: 1,),
                 TombolButton('.')
               ], 
              ),
            ),
              
          ], 
         ), 
        ),
      ),
    );
  }
}