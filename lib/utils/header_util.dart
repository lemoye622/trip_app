// 接口所需请求 header 信息

import 'package:trip_app/dao/login_dao.dart';

getHeaders() {
  Map<String, String> header = {
    "auth-token": "ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyMC1mYQ==ft",
    "course-flag": "ft",
    "boarding-pass": LoginDao.getBoardingPass() ?? ''
  };
  return header;
}