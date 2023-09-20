import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_examples/presentation/models/post_model.dart';
import 'package:retrofit_examples/presentation/service/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest api"),
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));

    return FutureBuilder(
        future: apiService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<PostModel> posts = snapshot.data!;
            return _posts(posts);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _posts(List<PostModel> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              children: [
                Text(posts[index].title),
                const SizedBox(
                  height: 12,
                ),
                Text(posts[index].body),
                const SizedBox(
                  height: 12,
                ),
                Text(posts[index].userId.toString()),
                const SizedBox(
                  height: 12,
                ),
                Text(posts[index].id.toString())
              ],
            ),
          );
        });
  }
}
