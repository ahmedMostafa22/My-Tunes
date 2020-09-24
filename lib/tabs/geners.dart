import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/geners.dart';
import 'package:task/widgets/genere_item.dart';

class Geners extends StatefulWidget {
  final String token;

  const Geners({Key key, this.token}) : super(key: key);
  @override
  _GenersState createState() => _GenersState();
}

class _GenersState extends State<Geners> {
  Future _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<GenersProvider>(context, listen: false)
        .fetchGeners(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _future,
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting)
              return Center(child:  SpinKitWanderingCubes(
                  itemBuilder: (context, i) {
                    return DecoratedBox(
                        decoration: BoxDecoration(
                      color: Colors.blue[600],
                    ));
                  },
                ),);
            else {
              List<String> genres =
                  Provider.of<GenersProvider>(context, listen: false).geners;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: 3 , crossAxisSpacing: 8 , mainAxisSpacing: 8),
                      itemCount: genres.length,
                  itemBuilder: (context, i) => GenreItem(genere: genres[i],token: widget.token,));
            }
          }),
    );
  }
}
