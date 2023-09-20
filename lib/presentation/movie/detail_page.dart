import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String? posterPath;
  String? originalTitle;
  String? releaseDate;
  String? overview;

  DetailPage(
      {required this.posterPath,
      required this.originalTitle,
      required this.releaseDate,
      required this.overview,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191826),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.network(
                    posterPath.toString(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  originalTitle.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10,),
                Text(
                  releaseDate.toString(),
                  style: const TextStyle(color: Color(0xff868597)),
                ),
                const SizedBox(height: 10,),
                Text(
                  overview.toString(),
                  style: const TextStyle(color: Color(0xff868597,)),
                ),
                const SizedBox(height: 32,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff43370),
                      fixedSize: const Size(300, 72),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text('Watch video', style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(height: 8,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
