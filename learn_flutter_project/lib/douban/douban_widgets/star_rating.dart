import 'package:flutter/material.dart';

class JRStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unSelectedColor;
  final Color selectedColor;
  final Widget unSelectedImage;
  final Widget selectedImage;

  JRStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unSelectedImage,
    Widget selectedImage,
  }) : unSelectedImage = unSelectedImage ?? Icon(Icons.star_border, color: unSelectedColor, size: size,),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _JRStarRatingState createState() => _JRStarRatingState();
}

class _JRStarRatingState extends State<JRStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min,
            children: buildStarRatingUI(widget.count)),
        Row(
            mainAxisSize: MainAxisSize.min,
            children: buildSelectedStart(widget.count))
      ],
    );
  }

  // 初始化星级评分UI
  List<Widget> buildStarRatingUI(int count) {
    return List.generate(count, (index) {
      return widget.unSelectedImage;
    });
  }

  /**
   * 选中星级评分需求
   * 1、算出整数部分的星
   * 2、选出小数部分的星
   * 3、对小数部分的星进行裁剪(cellValue * widget.size)
   */
  List<Widget> buildSelectedStart(int count) {
    final star = widget.selectedImage;

    List<Widget> stars = [];

    // 获取整数位置的评分
    double oneStarRate = widget.maxRating / count;
    int entireCount = (widget.rating / oneStarRate).floor();

    for (int i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    // 获取余数位置的评分
    double halfWidth =
        ((widget.rating / oneStarRate) - entireCount) * widget.size;

    // 裁剪
    final halfStar = ClipRect(
      clipper: JRStarRatingClipper(halfWidth),
      child: star,
    );
    stars.add(halfStar);

    if (stars.length > widget.count) {
      stars.sublist(0, widget.count);
    }

    return stars;
  }
}

class JRStarRatingClipper extends CustomClipper<Rect> {
  double width;
  JRStarRatingClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(JRStarRatingClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}