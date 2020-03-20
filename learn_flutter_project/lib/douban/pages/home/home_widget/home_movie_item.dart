import 'package:flutter/material.dart';
import 'package:learn_flutter_project/douban/douban_widgets/common_spacing_item.dart';
import 'package:learn_flutter_project/douban/douban_widgets/dash_line.dart';
import 'package:learn_flutter_project/douban/douban_widgets/star_rating.dart';
import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';

class JRHomeMovieItem extends StatelessWidget {
  final MovieItem movieItem;

  JRHomeMovieItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return getMovieItemContainer();
  }

  // 1.整体内容框架
  Widget getMovieItemContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration:
          setBottomSeperatorLine(10, Color.fromARGB(255, 204, 201, 204)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          setTopRankingArea(),
          JRCommonSpacingItem(height: 10),
          setMovieInfoArea(),
          JRCommonSpacingItem(height: 10),
          setBottomArea(),
          JRCommonSpacingItem(height: 10),
        ],
      ),
    );
  }

  // 2.设置底部分割线
  BoxDecoration setBottomSeperatorLine(double size, Color color) {
    return BoxDecoration(
        border:
            BorderDirectional(bottom: BorderSide(width: size, color: color)));
  }

  // 3.设置顶部排名区
  Widget setTopRankingArea() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Color.fromARGB(255, 231, 208, 157)),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Text(
        'No.${this.movieItem.rank}',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 4.设置中间电影内容区
  Widget setMovieInfoArea() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        setMovieImageArea(),
        JRCommonSpacingItem(
          widht: 10,
        ),
        setMovieDescriptionArea(),
        JRCommonSpacingItem(
          widht: 10,
        ),
        setMovieDashedLineArea(),
        JRCommonSpacingItem(
          widht: 10,
        ),
        setMovieLikeArea()
      ],
    );
  }

  // 4.1 设置图片区
  Widget setMovieImageArea() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        '${this.movieItem.imageURL}',
        width: 100,
      ),
    );
  }

  // 5.设置电影信息区
  Widget setMovieDescriptionArea() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        setMovieDescriptionTitle(),
        JRCommonSpacingItem(height: 10),
        setMovieDescriptionRank(),
        JRCommonSpacingItem(height: 10),
        setMovieDescriptionActors()
      ],
    ));
  }

  // 5.1.1 设置信息头部标题区域
  Widget setMovieDescriptionTitle() {
    return Text.rich(
      TextSpan(children: [
        WidgetSpan(
            child: Icon(
          Icons.play_circle_outline,
          color: Colors.pink,
        )),
        TextSpan(
          text: ' ${this.movieItem.title}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextSpan(
            text: '(${this.movieItem.playDate})',
            style: TextStyle(fontSize: 18, color: Colors.grey))
      ]),
    );
  }

  // 5.1.2 设置信息头部平评分区域
  Widget setMovieDescriptionRank() {
    return Row(
      children: <Widget>[
        JRStarRating(
          rating: this.movieItem.rating,
          size: 20,
          selectedColor: Color.fromARGB(255, 231, 208, 157),
        ),
        Text(
          ' ${this.movieItem.rating}',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  // 5.1.3 设置类型、导演信息区
  Widget setMovieDescriptionActors() {
    return Text(
      '${this.movieItem.getMovieActorInfo}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 6.设置虚线
  Widget setMovieDashedLineArea() {
    return Container(
      height: 100,
      child: JRDashLinne(
        axis: Axis.vertical,
        dotCount: 10,
        lineColor: Color.fromARGB(255, 204, 204, 204),
        dashLineWidth: .5,
        dashLineHeight: 6,
      ),
    );
  }

  // 7.设置想看
  Widget setMovieLikeArea() {
    return Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/home/wish.png',
              width: 30,
            ),
            JRCommonSpacingItem(
              height: 5,
            ),
            Text(
              '想看',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 244, 174, 75)),
            )
          ],
        ));
  }

  // 8.设置底部区域
  Widget setBottomArea() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(255, 234, 234, 234),
      width: double.infinity,
      child: Text(
        this.movieItem.originalTitle
      ),
    );
  }
}
