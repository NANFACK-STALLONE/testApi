import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api1/Models/UserModels.dart';
import 'package:http/http.dart' as http;

class Exemple3 extends StatefulWidget {
  const Exemple3({super.key});

  @override
  State<Exemple3> createState() => _Exemple3State();
}

class _Exemple3State extends State<Exemple3> {

  List<UserModels> userList=[];
  Future<List<UserModels>> getUserApi()async{
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data =jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        print(i['name']);
        userList.add(UserModels.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api test"),
      ),
      body: Column(
        children: [
           Expanded(child: FutureBuilder(
               future: getUserApi(),
               builder: (context,AsyncSnapshot<List<UserModels>> snapchot) {
                 if (!snapchot.hasData) {
                   return CircularProgressIndicator();
                 } else {
                   return ListView.builder(
                       itemCount: userList.length,
                       itemBuilder: (context, index) {
                         return Card(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Text("data"),
                                     Text(snapchot.data![index].name.toString())
                                   ],
                                 )
                               ],
                             ),
                           ),
                         );
                       });
                 }
               }
               )
           )
        ],
      ),
    );
  }
}
