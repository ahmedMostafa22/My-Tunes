import 'package:flutter/material.dart';
import 'package:task/models/playlist.dart';

class PlaylistItem extends StatelessWidget {
  final PlaylistModel playlist;

  const PlaylistItem({this.playlist});
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
                  playlist.art,
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
                playlist.name,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    color: Colors.grey,
                    size: 15,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(playlist.date.substring(0,10))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
