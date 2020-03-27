import 'package:flutter/material.dart';
import 'package:learn_flutter_project/douban/douban_widgets/common_spacing_item.dart';
import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';
import 'package:learn_flutter_project/tool/log_tool/log_tool.dart';

class JRNewsSingleImageItem extends StatelessWidget {
  final MovieItem movieItem;

  JRNewsSingleImageItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return setSingleImageNewsItemsContainer(context);
  }

  // 1.设置整体框架
  Widget setSingleImageNewsItemsContainer(BuildContext context) {
    GlobalKey key = GlobalKey();
    final Text mytext = Text(
      '123123123123123',
      key: key,
    );

    print('${context}');
    return Column(
      children: <Widget>[mytext, setTextWithCtx(context)],
    );
  }

  Widget setTextWithCtx(BuildContext ctx) {
    print(ctx.size);
    return Text('5555555');
  }
}

// Container(
//         decoration: BoxDecoration(
//             border: BorderDirectional(
//                 bottom: BorderSide(
//                     width: 2, color: Color.fromARGB(255, 224, 224, 224)))),
//         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//         child:  Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//                 Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 JRNewsSingleImageTitle(),
//                 JRCommonSpacingItem(
//                   widht: 10,
//                 ),
//                 Image.network(
//                   '${this.movieItem.imageURL}',
//                   width: 100,
//                 ),
//               ],
//             ),
//             Text('123123123123123')
//           ],
//         )
//     )

class JRNewsSingleImageTitle extends StatelessWidget {
  GlobalKey _titleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        key: _titleKey,
        child: GestureDetector(
          child: Text(
            '123123123123',
          ),
          onTap: () {
            print('${this._titleKey.currentContext}');
          },
        ));
  }
}
