import 'package:flutter/material.dart';
import 'package:task/models/album.dart';
import 'package:task/models/playlist.dart';
import 'package:task/screens/album_tracks.dart';
import 'package:task/screens/tracks_list.dart';

class PlaylistItem extends StatelessWidget {
  final PlayList playlist;
  final Album album;
  final String token;
  PlaylistItem({this.playlist, this.album, this.token});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (playlist != null)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TracksList(
                        playListId: playlist.id,
                        token: token,
                        name: playlist.plName,
                        art: playlist.art,
                      )));
        else
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumTracks(
                        albumId: album.id,
                        token: token,
                        albumName: album.name,
                        albumImage: album.art,
                      )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        color: Colors.black,
        child: ListTile(
          trailing: Icon(Icons.playlist_play, color: Colors.blue[600]),
          leading: Image.network(album == null ? playlist.art : album.art),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                album == null ? playlist.plName : album.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('by: ' + (album == null ? playlist.owner : album.artistName))
            ],
          ),
        ),
      ),
    );
  }
}
