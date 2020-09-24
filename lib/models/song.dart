import 'package:flutter/cupertino.dart';

class SongModel with ChangeNotifier {
  final String subtext;
  final String name;
  final String art;
  final String id;
  SongModel({@required this.id, this.subtext, this.name, this.art});
}
