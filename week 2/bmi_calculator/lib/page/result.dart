import 'package:bmi_calculator/components/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi, this.resultText, this.interperen, this.colorResult});

  final String bmi;
  final String resultText;
  final String interperen;
  final Color colorResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.6, -0.6),
          stops: [1, 1, ],
          colors: [
              Color(0xff313131),
              Color(0xff363636), //orange
          ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: Text(
                     resultText.toString(),
                     style: TextStyle(
                      color: colorResult,
                      fontWeight: FontWeight.bold 
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Image.asset('image/BMI.png',width: 150, height: 150,color: kActiveColor,)),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: Text(bmi.toString(),style: kNumberText,),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: Text(interperen.toString(),style: TextStyle(fontSize: 20,color: kColorResult),),
                 ),
               ],
             ))
         ], 
        ),
    ),
      ),
  );  
  }
}