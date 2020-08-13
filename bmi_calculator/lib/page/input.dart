import 'package:bmi_calculator/components/constant.dart';
import 'package:bmi_calculator/components/gender.dart';
import 'package:bmi_calculator/components/iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                     chardchild: Icon(FontAwesomeIcons.mars)
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
                     chardchild: Icon(FontAwesomeIcons.venus),), 
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
                 style: TextStyle(fontSize: 60,color: Colors.white), 
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

  
          
         ], 
        ), 
       ), 
    );
  }
}




