import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;
setup() async{
  sl.registerSingleton(await SharedPreferences.getInstance());
}
