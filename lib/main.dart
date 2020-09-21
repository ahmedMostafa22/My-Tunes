import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/album.dart';
import 'package:task/providers/artist.dart';
import 'package:task/providers/geners.dart';
import 'package:task/providers/playlist.dart';
import 'package:task/providers/overview_content.dart';
import 'package:task/screens/auth_screen.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GenersProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AlbumsProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlaylistsProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => OverviewProvider(),
          ),ChangeNotifierProvider(
            create: (context) => PlaylistsProvider(),
          ),ChangeNotifierProvider(
            create: (context) => ArtistsProvider(),
          ),ChangeNotifierProvider(
            create: (context) => AlbumsProvider(),
          )
        ],
        child: MaterialApp(
            theme: ThemeData.dark().copyWith(accentColor: Colors.blue[600]),
            home: MyApp())));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return WebSpotify();
  }
}
