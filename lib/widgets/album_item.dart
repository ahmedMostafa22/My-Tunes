import 'package:flutter/material.dart';
import 'package:task/models/album.dart';

class AlbumItem extends StatelessWidget {
  final Album album;

  const AlbumItem({this.album});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: 155,
      height: 185,
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
                  'https://3.imimg.com/data3/UB/NF/MY-646899/men-s-wear-500x500.jpg',
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
                'Title',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 3,
              ),
              Text('Artist', style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 3,
              ),
              Text(
                'Release Date',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
