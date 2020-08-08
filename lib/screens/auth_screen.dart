import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:task/screens/home.dart';

class WebSpotify extends StatefulWidget {
  @override
  _WebSpotifyState createState() => _WebSpotifyState();
}

final credentials = SpotifyApiCredentials(
    'db50989a20a246a2b4d946e6fe922869', 'c0b45fdc225442b28ce0e865bf81ca73');
final grant = SpotifyApi.authorizationCodeGrant(credentials);
final redirectUri = 'spotify-sdk://auth';
final scopes = ['user-read-email', 'user-library-read','user-read-recently-played'];
final authUri =
    grant.getAuthorizationUrl(Uri.parse(redirectUri), scopes: scopes);
var responseUri;
SpotifyApi spotify;

class _WebSpotifyState extends State<WebSpotify> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: authUri.toString(),
          navigationDelegate: (navReq) {
            if (navReq.url.startsWith(redirectUri)) {
              responseUri = navReq.url;
              final spotify = SpotifyApi.fromAuthCodeGrant(grant, responseUri);
              spotify.getCredentials().then((value) =>
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(spotify: spotify))));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
