import 'package:learn_flutter_project/_14_screenfit/Tools/screen_fit_tool.dart';

extension DoubleFit on double {
  double px() {
    return JRScreenFitTool.setPx(this);
  }

  double rpx() {
    return JRScreenFitTool.setRpx(this);
  }
}
