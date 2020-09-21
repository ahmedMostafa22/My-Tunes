import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/overview_content.dart';
import 'package:task/widgets/song_item.dart';
import 'package:task/models/song.dart';

class Overview extends StatefulWidget {
  final String token;
  const Overview({this.token});
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  Future _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<OverviewProvider>(context, listen: false)
        .fetchOverview(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final overviewProvider =
        Provider.of<OverviewProvider>(context, listen: false);
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _future,
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting)
              return Center(
                child: SpinKitWanderingCubes(
                  itemBuilder: (context, i) {
                    return DecoratedBox(
                        decoration: BoxDecoration(
                      color: Colors.blue[600],
                    ));
                  },
                ),
              );
            else {
              List<SongModel> recentList = overviewProvider.recents;
              List<SongModel> todayRecommendation = overviewProvider.todayRecom;
              List<SongModel> newReleases = overviewProvider.newReleases;
              List<SongModel> topTracks = overviewProvider.topTracks;
              List<SongModel> legacy = overviewProvider.legacy;
              List<SongModel> oldSchool = overviewProvider.oldSchool;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Text(
                      'Recently Played',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: width,
                    height: height * 0.25,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recentList.length,
                        itemBuilder: (context, i) =>
                            SongItem(songItem: recentList[i])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Today\'s Recommendation',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: todayRecommendation.length,
                          itemBuilder: (context, j) =>
                              SongItem(songItem: todayRecommendation[j]))),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'New Releases',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newReleases.length,
                          itemBuilder: (context, j) =>
                              SongItem(songItem: newReleases[j]))),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Your Favorite',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topTracks.length,
                          itemBuilder: (context, j) =>
                              SongItem(songItem: topTracks[j]))),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Legacy Songs',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: legacy.length,
                          itemBuilder: (context, j) =>
                              SongItem(songItem: legacy[j]))),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Old School',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: oldSchool.length,
                          itemBuilder: (context, j) =>
                              SongItem(songItem: oldSchool[j]))),
                ],
              );
            }
          }),
    );
  }
}
//secret c0b45fdc225442b28ce0e865bf81ca73
// client id db50989a20a246a2b4d946e6fe922869
// redircet url spotify-sdk://auth
