import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final String genere;

  const GenreItem({this.genere});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
