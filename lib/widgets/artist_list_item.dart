import 'package:flutter/material.dart';
import 'package:task/models/artist.dart';

class ArtistListItem extends StatelessWidget {
  final Artist artist;

  ArtistListItem({this.artist});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      color: Colors.black,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(artist.image),
            radius: 40,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artist.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 4),
              Text('Followers: ' + artist.followers)
            ],
          ),
        ],
      ),
    );
  }
}
