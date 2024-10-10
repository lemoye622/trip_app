import 'package:flutter/material.dart';
import 'package:trip_app/pages/home.dart';
import 'package:trip_app/pages/login.dart';

class NavigatorUtil {
  // 用于在获取不到 context 的地方，如 dao 中跳转页面时使用，需要在 home 页面赋值
  static BuildContext? _context;

  // 更新上下文
  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
  }

  // 跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // 跳转到首页
  static goToHome(BuildContext context) {
    // 将首页放到栈顶，实现跳转到首页后不让返回到上一页
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  // 跳转到登录页
  static goToLogin() {
    Navigator.pushReplacement(
        _context!, MaterialPageRoute(builder: (context) => const Login()));
  }
}
