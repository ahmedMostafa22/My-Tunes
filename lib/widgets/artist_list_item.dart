import 'package:flutter/material.dart';
import 'package:task/models/artist.dart';
import 'package:task/screens/artist_top_tracks.dart';

class ArtistListItem extends StatelessWidget {
  final Artist artist;
  final String token;
  ArtistListItem({this.artist, this.token});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArtistTracks(
                      artistId: artist.id,
                      token: token,
                      artistName: artist.name,
                      artistImage: artist.image,
                    )));
      },
      child: Container(
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
      ),
    );
  }
}
