
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 import 'package:flutter_test1/photos.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List<PhotosModel> photos = [];
  Future<List<PhotosModel>> getPhotos() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      for (var element in decodedData) {
        photos.add(PhotosModel.fromJson(element));
      }
    }

    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHOTOS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<PhotosModel>>(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PhotosModel> data = snapshot.data!;
            return 
            ///sida map cml dATA iku kena  listView
            ListView.builder(
              itemBuilder: (context, index) => Container(
                
                 margin: const EdgeInsets.all(12),
                 //mavna uyela datdedana listTitle
                child: ListTile(

                  leading: Container(
                   
                    child: Image.network(data[index].thumnailUrl ?? ""),
                  ),
                   title: Text(data[index].title??""),
                  trailing: Text(data[index].id.toString()),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

































// import 'dart:convert';
// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:flutter_test1/photos.dart';
// import 'package:http/http.dart ' as http;
// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

  
//   List<Photos> photos=[];


//   Future<List<Photos>> getPhots() async{
//     try{
//       var response=await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//       if(response.statusCode==200){
//         List data=jsonDecode(response.body);
//         //print(data);
//         for(var element in data){
//           photos.add(element);
//         }
//       }
//     }catch(e){
//       print('error $e');
//     }

//     return photos;
  
//   }





//   @override

//   Widget build(BuildContext context) {
//     return  Scaffold(
      
//       appBar: AppBar(
        
//         backgroundColor: Colors.green,
//         title: Text('loading photos'),
//         elevation: 0,
//         centerTitle: true,
//       ),
      

//       body: FutureBuilder(
//         future: getPhots(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             return Text('xog aya la haya');
//           }else if  (snapshot.hasError){
//             return Text('eeror accured');
//           }
//           return Center(child:  CircularProgressIndicator());
             
//           }
        
        
//         ), 


    
//     );
//   }
// }


