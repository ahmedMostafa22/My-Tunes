import 'package:flutter/material.dart';
import 'package:task/models/song.dart';

class SongItem extends StatelessWidget {
  final SongModel songItem;
  final String token;
  const SongItem({this.songItem, this.token});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.black,
      width: 155,
      height: 165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 155,
            height: 125,
            color: Colors.black,
            child: GridTile(
              footer: GridTileBar(
                  leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.black38, shape: BoxShape.circle),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  songItem.art,
                  fit: BoxFit.cover,
                  width: 155,
                  height: 125,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 3,
              ),
              Text(
                songItem.name,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Text(songItem.subtext)
            ],
          ),
        ],
      ),
    );
  }
}
