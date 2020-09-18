import 'package:flutter/material.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
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
          body: SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                    padding: EdgeInsets.fromLTRB(42, 0, 42, 0),
                    child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                           borderRadius: BorderRadius.circular(10) 
                          ),
                         child: Icon(
                           Icons.image,
                           color: Color(0xFFff7f56),
                           size: 30,
                         ), 
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                    Text("Keindahan alam di ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    Text("Jaga baik",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
                    ],
                  ),
                 ], 
                )
              ),

              SizedBox(height: 300,),

              Container(
               child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, '/signup');
                     },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFff7f56),
                       borderRadius: BorderRadius.circular(50) 
                      ),
                      child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20))), 
                     ), 
                    ], 
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, '/login');
                     },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(123.8, 20, 123.8, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                       borderRadius: BorderRadius.circular(50) 
                      ),
                      child: Text('Sign In',style: TextStyle(color: Color(0xFFff7f56),fontSize: 20))), 
                     ), 
                    ], 
                  )
                ]
               ), 
              )

            ], 
           ), 
          ),
        ),
      ],
    );
  }
}