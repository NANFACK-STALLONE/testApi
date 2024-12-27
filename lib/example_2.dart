import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Exemple_2 extends StatefulWidget {
  const Exemple_2({super.key});

  @override
  State<Exemple_2> createState() => _Exemple_2State();
}

class _Exemple_2State extends State<Exemple_2> {

  List<Photos> photoList =[];

  Future<List<Photos>> getPhotos ()async{
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data =jsonDecode(response.body.toString());
    if(response.statusCode==200){
         for(Map i in data){
           Photos photos=Photos(title: i['title'], url: i['url'], id: i['id']);
           photoList.add(photos);
         }
         return photoList;
    }
    else{
       return photoList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Course"),
      ),
      body: Column(
        children: [
         Expanded(
           child: FutureBuilder(
               future: getPhotos(),
               builder: (context,AsyncSnapshot<List<Photos>> snapshot){
            return ListView.builder(
                itemCount: photoList.length,
                itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                ),

                subtitle: Text(snapshot.data![index].title.toString()),

                title: Text(snapshot.data![index].title.toString()),
              );
            });
            }),
         )
        ],
      ),
    );
  }
}

class Photos {
  String title;
  String url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}


