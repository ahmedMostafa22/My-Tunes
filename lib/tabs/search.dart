import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/song.dart';
import 'package:task/providers/search.dart';
import 'package:task/widgets/song_item.dart';

class SearchTab extends StatefulWidget {
  final String token;

  const SearchTab({Key key, this.token}) : super(key: key);
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  bool loading = false;
  final _textFieldController = TextEditingController();
  List<SongModel> songs = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.blue[600]),
                  hintText: 'Want to find a track ?',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
              textInputAction: TextInputAction.search,
              onChanged: (text) async {
                setState(() {
                  loading = true;
                  songs.clear();
                });
                final searchProvider =
                    Provider.of<SearchProvider>(context, listen: false);
                await searchProvider.fetchSearchResult(widget.token, text);
                songs = searchProvider.tracksSearchResult;
                setState(() {
                  loading = false;
                });
              },
            ),
            loading
                ? Center(
                    child: SpinKitWanderingCubes(
                      itemBuilder: (context, i) {
                        return DecoratedBox(
                            decoration: BoxDecoration(
                          color: Colors.blue[600],
                        ));
                      },
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: songs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, i) => SongItem(
                              songItem: songs[i],
                              token: widget.token,
                            )),
                  )
          ],
        ),
      ),
    );
  }
}
