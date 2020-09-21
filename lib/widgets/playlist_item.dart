import 'package:flutter/material.dart';
import 'package:task/models/album.dart';
import 'package:task/models/playlist.dart';

class PlaylistItem extends StatelessWidget {
  final PlayList playlist;
  final Album album; 

  PlaylistItem({this.playlist, this.album});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.black,
      child: ListTile(
        leading: Image.network(album==null?playlist.art:album.art),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(album==null?
              playlist.plName:album.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('by: ' +(album==null? playlist.owner:album.artistName))
          ],
        ),
      ),
    );
  }
}
