import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/constant.dart';
import 'package:bmi_calculator/components/gender.dart';
import 'package:bmi_calculator/components/iconbutton.dart';
import 'package:bmi_calculator/page/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';


enum Gender{
  male,
  famale,
}
class InputBmi extends StatefulWidget {
  InputBmi({Key key}) : super(key: key);

  @override
  _InputBmiState createState() => _InputBmiState();
}

class _InputBmiState extends State<InputBmi> {
  Gender selectedGender; 
  int age = 20;
  int height = 150;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.6, -0.6),
              stops: [1, 1],
              colors: [
                  Color(0xff313131),
                  Color(0xff363636), //orange
              ],
            ),
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                   child: Text('BMI Calculator',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 ),
               ],
             ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: Text('Gender kamu ?',),
                 )
               ],
             ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                     child: Result_Gender(
                       onPress: (){
                         setState(() {
                           selectedGender = Gender.male;
                         });
                       },
                       colour: selectedGender == Gender.male ? kActiveColor : kDisableColor,
                       chardchild: Icon(
                         FontAwesomeIcons.mars,
                         color: selectedGender == Gender.male ? kDisableColor : kIconAktive,
                         )
                       ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Cowok'),
                    )
                  ],
                ),
                SizedBox(width: 50,),
                 Column(
                   children: [
                     Container(
                     child: Result_Gender(
                       onPress: (){
                         setState(() {
                           selectedGender = Gender.famale;
                         });
                       },
                       colour: selectedGender == Gender.famale ? kActiveColor : kDisableColor,
                       chardchild: Icon(
                          FontAwesomeIcons.venus,
                          color: selectedGender == Gender.famale ? kDisableColor : kIconAktive,
                       ),), 
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Cewek'),
                      )
                   ],
                 )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Divider(
               color: Colors.white, 
              ),
            ),

              Row(
                 children: [
                   Text('Umur kamu berapa ?'),
                 ],
               ),
              Row(
               children: [
                 Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
                  child: Text(
                   age.toString(),
                   style: kNumberText, 
                  ), 
                 ),
                 Column(
                  children: [
                    ButtonIcon(
                      onPress: (){
                        setState(() {
                          age++;
                        });
                      },
                      icon: Icons.arrow_drop_up,
                    ),
                    SizedBox(height: 10,),
                    ButtonIcon(
                      onPress: (){
                        setState(() {
                          age--;
                        });
                      },
                      icon: Icons.arrow_drop_down,
                    )
                  ], 
                 ),
               ], 
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Divider(
               color: Colors.white, 
              ),
            ),

            Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Tinggi badan mu ?'),
                   Text('Berat badan mu ?')
                 ],
               ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                       _tinggiBadan();
                      },
                      child: Row(
                        children: [
                          Text(height.toString(),style: TextStyle(fontSize: 50,)),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text('Cm'),
                          )
                        ],
                      )),
                  InkWell(
                      onTap: (){
                       _berat();
                      },
                      child: Row(
                        children: [
                          Text(weight.toString(),style: TextStyle(fontSize: 50,)),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text('Kg'),
                          )
                        ],
                      )),
                ], 
               )
             ], 
            ),
            SizedBox(height: 30,),
            Center(
              child: GestureDetector(
                onTap: (){
                  CalculatorBrain calc  = CalculatorBrain(weight: weight,height: height);
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ResultPage(
                    bmi: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interperen: calc.getIndependen(),
                    colorResult: calc.getColorText(),
                  )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  decoration:bCalculatebt,
                  child: Text('Calculator bmi kamu',style: kCalculateText,)),
              ),
            ),

           ], 
          ), 
         ),
      ), 
    );
  }
  void _tinggiBadan() {
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return NumberPickerDialog.integer(
         minValue: 100, 
         maxValue: 250, 
         title: Text('Sesuaikan tinggi badan mu'),
         initialIntegerValue: height);
     }
   ).then((value) {
     if (value != null) {
       setState(() {
         height = value;
       });
     }
   });
 }
 void _berat() {
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return NumberPickerDialog.integer(
         minValue: 10, 
         maxValue: 150, 
         title: Text('Sesuaikan Berat badan mu'),
         initialIntegerValue: weight);
     }
   ).then((value) {
     if (value != null) {
       setState(() {
         weight = value;
       });
     }
   });
 }
}




