import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.name,this.pass});
  String name ;
  String pass ;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/Backround.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
         backgroundColor: Colors.transparent, 
         body: Container(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 80),
           child: Column(
            children: [
              Card(
               child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                     children: [
                       Text('UserName',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 15,),
                       Text(':',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 10,),
                       Text('$name',style: TextStyle(),),
                     ], 
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                     children: [
                       Text('Password',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 19,),
                       Text(':',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 10,),
                       Text('$pass',style: TextStyle(),),
                     ], 
                    ),
                  )
                ], 
               ), 
              ),
              SizedBox(height: 50,),
              Center(
              child: GestureDetector(
                 onTap: (){
                   Navigator.popAndPushNamed(context, '/');
                 },
                child: Container(
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFff7f56),
                   borderRadius: BorderRadius.circular(10) 
                  ),
                  child: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 20))), 
                 ),
            ), 
            ], 
           ),
          ), 
         ),
      ],
    );
  }
}