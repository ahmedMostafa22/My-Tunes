import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/models/album.dart';
import 'package:task/models/artist.dart';
import 'package:task/providers/album.dart';
import 'package:task/providers/artist.dart';
import 'package:task/providers/geners.dart';
import 'package:task/providers/playlist.dart';
import 'package:task/providers/overview_content.dart';
import 'package:task/providers/search.dart';
import 'package:task/screens/auth_screen.dart';

import 'models/playlist.dart';

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
          ),ChangeNotifierProvider(
            create: (context) => PlayList(),
          ),ChangeNotifierProvider(
            create: (context) => Artist(),
          ),ChangeNotifierProvider(
            create: (context) => Album(),
          ), ChangeNotifierProvider(
            create: (context) => SearchProvider(),
          ),
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
