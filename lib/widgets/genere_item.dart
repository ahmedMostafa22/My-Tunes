import 'package:flutter/material.dart';
import 'package:task/screens/genre_tracks_list.dart';

class GenreItem extends StatelessWidget {
  final String genere;
  final String token; 
  const GenreItem({this.genere, this.token});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GenreTracks(genere: genere,token: token,) ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.02, 1],
                    colors: [Colors.blue[900], Colors.blue])),
            child: Text(
              genere.toUpperCase(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
      ),
    );
  }
}
