import 'package:dio/dio.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({bool useToken = true}) {
    if (sl.get<SharedPreferences>().getString("token") == null) {
      throw NoTokenFound();
    } else {
      if (useToken) {
        return Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${sl.get<SharedPreferences>().getString("token")}",
          },
        );
      } else {
        return Options(headers: {'Content-Type': 'application/json'});
      }
    }
  }
}
