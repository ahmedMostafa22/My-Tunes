import 'package:flutter/cupertino.dart';

class SongModel with ChangeNotifier {
  final String date;
  final String name;
  final String art;
  SongModel({this.date, this.name, this.art});
}
