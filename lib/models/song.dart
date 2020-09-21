import 'package:flutter/cupertino.dart';

class SongModel with ChangeNotifier {
  final String subtext;
  final String name;
  final String art;
  SongModel({this.subtext, this.name, this.art});
}
