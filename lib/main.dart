import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/album.dart';
import 'package:task/providers/category.dart';
import 'package:task/providers/playlist.dart';
import 'package:task/screens/auth_screen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CategoriesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AlbumsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => PlaylistsProvider(),
      ),
    ], child: MaterialApp(theme: ThemeData.dark(), home: MyApp())));

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
