import 'package:notee/database/database.dart';

class AppDatabaseHelper {
  AppDatabaseHelper.createInstance();
  static AppDatabaseHelper _appDatabaseHelper;
  factory AppDatabaseHelper() {
    if (_appDatabaseHelper == null) {
      _appDatabaseHelper = AppDatabaseHelper.createInstance();
    }
    return _appDatabaseHelper;
  }

  AppDatabase database;
}
