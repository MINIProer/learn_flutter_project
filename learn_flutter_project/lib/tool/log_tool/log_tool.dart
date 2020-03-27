void JRLog(String message, StackTrace stackTrace) {
  JRLogTool logTool = JRLogTool(stackTrace);
  print('信息 = ${message}，所在文件 = ${logTool.fileName}，所在行 = ${logTool.lineNumber}');
}

class JRLogTool {
  final StackTrace _stackTrace;
  String fileName;
  int lineNumber;

  JRLogTool(this._stackTrace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._stackTrace.toString().split('\n')[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfFileInfo = fileInfo.split(':');
    this.fileName = listOfFileInfo[0];
    this.lineNumber = int.parse(listOfFileInfo[1]);
  }
}
