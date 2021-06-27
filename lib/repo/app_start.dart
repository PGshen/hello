import 'package:hello/app/res/const_val.dart';
import 'package:hello/blocs/global/global_bloc.dart';
import 'package:hello/repo/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStart {
  Future<GlobalState> initApp() async {
    SharedPreferences prefs = await LocalStorage.sp;

    int themeIndex = prefs.getInt(ConstVal.themeColorIndex) ?? 0;

    return GlobalState(
      themeColor: ConstVal.themeColor.keys.toList()[themeIndex]
    );
  }
}