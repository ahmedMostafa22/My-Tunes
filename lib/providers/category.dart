import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:task/models/category.dart';

class CategoriesProvider with ChangeNotifier{
  List<Category> categories = [] ; 
  Future<Void> getCategories(){
    return null; 
  }
}