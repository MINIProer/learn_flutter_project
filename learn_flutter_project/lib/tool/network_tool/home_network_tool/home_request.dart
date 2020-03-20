import 'package:learn_flutter_project/douban/model/home_model/home_model.dart';

import '../http_request.dart';
import 'package:learn_flutter_project/tool/const_tool/const.dart';

class JRHomeRequest {
  static Future<List<MovieItem>> requestNewMovieList(int start) async {
    // 1.构建URL
    final movieURL =
        '/movie/top250?start=$start&count=${JRHomeConfig.requestForMovieCount}';

    // 2.获取网络请求返回的结果
    final result = await JRRequestTool.request(movieURL);

    final subjects = result['subjects'];

    List<MovieItem> movies = [];
    for (var item in subjects) {
      movies.add(MovieItem.fromMap(item));
    }

    return movies;
  }
}
