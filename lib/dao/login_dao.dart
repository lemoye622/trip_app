import 'dart:convert';

import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:http/http.dart' as http;
import 'package:trip_app/utils/header_util.dart';
import 'package:trip_app/utils/navigator_util.dart';

class LoginDao {
  static const boardingPass = 'boarding_pass'; // 登录令牌

  static login({required String userName, required String password}) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = userName;
    paramsMap['password'] = password;
    var url = Uri.http('api.geekailab.com', 'uapi/user/login', paramsMap);
    final response = await http.post(url, headers: getHeaders());
    // 解决中文乱码问题
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        // 保存登录令牌
        _saveBoardingPass(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  static void _saveBoardingPass(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }

  static getBoardingPass() {
    return HiCache.getInstance().get(boardingPass);
  }

  static void logOut() {
    // 清除登录保存的信息
    HiCache.getInstance().remove(boardingPass);
    NavigatorUtil.goToLogin();
  }
}
