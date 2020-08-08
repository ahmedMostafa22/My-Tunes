import 'package:flutter/cupertino.dart';

class PlaylistModel with ChangeNotifier {
  final String date;
  final String name;
  final String art;
  PlaylistModel({this.date, this.name, this.art});
}
