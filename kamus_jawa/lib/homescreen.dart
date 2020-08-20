import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamus_jawa/network.dart';

// import 'ModelKamus.dart';

  List<Profil> _searchResult = []; //datalist

  List<Profil> _userDetails = [];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller =  TextEditingController();

  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(Profil.fromJson(user));
      }
    });
  }
  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              pinned: true,
              elevation: 20.0,
         centerTitle: true,
         title: Text('KAMUS BAHASA JAWA',
         ), 
        expandedHeight: 150,
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: <Widget>[
              SizedBox(height: 90.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 1.0),
                child:  Container(
                            decoration: BoxDecoration(
                             color: Colors.grey[800],
                             borderRadius: BorderRadius.circular(100),
                            ),
                            child: Column(
                             children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.search,
                                  color: Colors.white,),
                                title:  TextField(
                                controller: controller,
                                onChanged: onSearchTextChanged,
                                decoration:  InputDecoration(
                                    hintText: 'Search',
                                    focusedBorder: UnderlineInputBorder(
                                     borderSide: BorderSide.none 
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none
                                    )
                                    ),
                                  ),
                                trailing:  IconButton(
                                icon:  Icon(Icons.clear,),
                                onPressed: () {
                                controller.clear();
                                onSearchTextChanged('');
                                  }),
                              ),
                             ], 
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
        ];
      }, 
        body: Column(
          children: [
            Expanded(
                   child: _searchResult.length != 0 || controller.text.isNotEmpty ?
                   ListView.builder(
                   itemCount: _searchResult.length,
                   itemBuilder: (context, i) {
                   return  Padding(
                     padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                     child: Card(
                             elevation: 15.0,
                               child: Container(
                                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                               child: Column(
                                    children: <Widget>[
                                     Row(
                                       children: [
                                         Text(_searchResult[i].indo, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                                       ],
                                     ),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         Text(_searchResult[i].jawa, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                       ],
                                     ),
                                   ], 
                                  ),
                                  ),
                            ),
                   );
                      },
                    )
                    : ListView.builder(
                   itemCount: _userDetails.length,
                   itemBuilder: (context, i) {
                   return  Padding(
                     padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                     child: Card(
                             elevation: 15.0,
                               child: Container(
                                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                               child: Column(
                                    children: <Widget>[
                                     Row(
                                       children: [
                                         Text(_userDetails[i].indo, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                                       ],
                                     ),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         Text(_userDetails[i].jawa, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                       ],
                                     ),
                                   ], 
                                  ),
                                  ),
                            ),
                   );
                      },
                    ),          
            ),
          ],
        ),
        ), //file this in to drawerBeranda.dart
    );
  }
 onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.indo.contains(text) || userDetail.jawa.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}