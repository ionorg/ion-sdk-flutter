class Logger {
  Logger(this._appName) {}

  String _appName;

  void error(error) {
    print('[' + _appName + '] ERROR: ' + error);
  }

  void debug(msg) {
    print('[' + _appName + '] DEBUG: ' + msg);
  }

  void warn(msg) {
    print('[' + _appName + '] WARN: ' + msg);
  }

  void failure(error) {
    var log = '[' + _appName + '] FAILURE: ' + error;
    print(log);
    throw log;
  }
}

final log = Logger('ion-sdk-flutter');
