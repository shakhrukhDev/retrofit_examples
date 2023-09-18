import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_examples/presentation/models/post_model.dart';
import 'package:retrofit_examples/presentation/service/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rest api"),),
      body: _body(),
    );
  }

  FutureBuilder _body(){
    final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    
    return FutureBuilder(future: apiService.getPosts(), builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        final List<PostModel> posts = snapshot.data!;
        return _posts(posts);
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _posts(List<PostModel> posts){
    return ListView.builder(itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Text(posts[index].title),
            SizedBox(height: 12,),
            Text(posts[index].title)
          ],
        ),
      );
    });
  }
}
