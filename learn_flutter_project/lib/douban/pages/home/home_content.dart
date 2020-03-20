import 'package:flutter/material.dart';
import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';
import 'package:learn_flutter_project/tool/network_tool/home_network_tool/home_request.dart';

import 'home_widget/home_movie_item.dart';

class JRHomeContent extends StatefulWidget {
  @override
  _JRHomeContentState createState() => _JRHomeContentState();
}

class _JRHomeContentState extends State<JRHomeContent> {
  List<MovieItem> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    JRHomeRequest.requestNewMovieList(0).then((res) {
      
      setState(() {
        movies.addAll(res);
      });
      print('movies = $movies');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (ctx, index) {
              return JRHomeMovieItem(movies[index]);
            }));
  }
}
