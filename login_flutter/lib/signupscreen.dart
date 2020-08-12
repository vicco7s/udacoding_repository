import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'homescreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String nam;
  String pas;



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
          key: _key,
          backgroundColor: Colors.transparent,
         body: Container(
           alignment: Alignment.bottomCenter,
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  SizedBox(height: 115,),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50) ) 
                      ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: Text('Bikin Akun Baru',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                        SizedBox(height:10),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text('UserName',style: TextStyle(color: Colors.grey),),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                         child: TextFormField(
                           validator: (value) {
                              if (value.isEmpty) {
                                return 'Data tidak boleh kosong !!';
                              }
                              return null;
                            },
                           controller: usernameController,
                           decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.user,size: 20,color: Colors.grey,),
                            enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Color(0xFFff7f56)) 
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFff7f56))
                            ), 
                           ),
                         ), 
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text('Password',style: TextStyle(color: Colors.grey),),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                         child: TextFormField(
                           controller: passwordController,
                           validator: (value) {
                              if (value.isEmpty) {
                                return 'Data tidak boleh kosong !!';
                              }
                              return null;
                            },
                           obscureText: true,
                           decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.key,size: 20,color: Colors.grey,),
                            enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Color(0xFFff7f56)) 
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFff7f56))
                            ) 
                           ),
                            
                         ), 
                        ),
                        SizedBox(height: 30,),
                        Center(
                          child: GestureDetector(
                             onTap: (){
                               
                                 nam = usernameController.text;
                                 pas = passwordController.text;
                                
                                if (_formKey.currentState.validate()) {
                                  if (nam != 'admin') {
                                      _key.currentState.showSnackBar(SnackBar(
                                      content:Text('Username Salah'),
                                      backgroundColor: Color(0xFFff7f56),
                                      ));
                                  }else if (pas != nam) {
                                    _key.currentState.showSnackBar(SnackBar(
                                      content:Text('Password Salah'),
                                      backgroundColor: Color(0xFFff7f56),
                                    )
                                  );
                                }else{
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(name: nam,pass: pas,)));
                                }
                              }
                             },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFff7f56),
                               borderRadius: BorderRadius.circular(50) 
                              ),
                              child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20))), 
                             ),
                        ), 
                      ], 
                     ), 
                    ),
                ], 
               ),
             )
            ),
         )
        )
      ],
    );
  }
}