import 'package:flutter/material.dart';
import 'package:task/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category ;

  const CategoryItem({this.category}); 
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
                  stops: [0.3, 1],
                  colors: [Colors.purple[300], Colors.deepPurple])),
          child: Text(
            'HIP-HOP',
            textAlign: TextAlign.right,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
