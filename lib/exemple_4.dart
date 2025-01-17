import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exemple4 extends StatefulWidget {
  const Exemple4({super.key});

  @override
  State<Exemple4> createState() => _Exemple4State();
}

class _Exemple4State extends State<Exemple4> {

  var data;
  Future<void> getUserApi ()async{
    final reponse =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(reponse.statusCode ==200){
       data=jsonDecode(reponse.body.toString());

    }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("api course"),
      ),
      body: Column(
        children: [
          Expanded(child:
          FutureBuilder(future: getUserApi(), builder: (
          context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text("loading");
            }else{
              return ListView.builder(
                  itemCount: data.length ,
                  itemBuilder: (context, index){
                return Card(
                  child: Column(
                    children: [
                      ReusbaleRow(title: 'name',value: data[index]['name'].toString(),),
                      ReusbaleRow(title: 'Username',value: data[index]['username'].toString(),),
                      ReusbaleRow(title: 'address',value: data[index]['address']['street'].toString(),),
                      ReusbaleRow(title: 'Lat',value: data[index]['address']['geo']['lat'].toString(),),
                      ReusbaleRow(title: 'Lat',value: data[index]['address']['geo']['lng'].toString(),),

                    ],
                  ),
                );
              });
            }
      },
          ),
          )
        ],
      ),
    );
  }
}
class ReusbaleRow extends StatelessWidget {
  final String title, value;
  const ReusbaleRow({Key?key,required this.title,required this.value}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ],
      ),
    );
  }
}
