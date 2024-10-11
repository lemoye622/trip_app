import 'package:flutter/material.dart';
import 'package:trip_app/dao/login_dao.dart';
import 'package:trip_app/utils/navigator_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trip_app/utils/string_util.dart';
import 'package:trip_app/utils/view_util.dart';
import 'package:trip_app/widgets/input_widget.dart';
import 'package:trip_app/widgets/login_button_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loginEnable = false;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘弹起影响布局
      body: Stack(
        children: [..._background(), _content()],
      ),
    );
  }

  _background() {
    return [
      Positioned.fill(
          child: Image.asset('images/login-bg1.jpg', fit: BoxFit.cover)),
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  _content() {
    return Positioned.fill(
        left: 25,
        right: 25,
        //    为了适配不同的手机页面，使用 ListView 使窄屏手机页面可以上下滚动
        child: ListView(children: [
          hiSpace(height: 100),
          const Text(
            '账号密码登录',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          hiSpace(height: 40),
          InputWidget('请输入账号', onChanged: (text) {
            userName = text;
            _checkInput();
          }),
          hiSpace(height: 10),
          InputWidget('请输入密码', isObscureText: true, onChanged: (text) {
            password = text;
            _checkInput();
          }),
          hiSpace(height: 45),
          LoginButtonWidget('登录',
              enable: loginEnable, onPressed: () => _login(context)),
          hiSpace(height: 15),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child:
                    const Text('注册账号', style: TextStyle(color: Colors.white)),
                onTap: () => _jumpRegistration(),
              ))
        ]));
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _login(context) async {
    try {
      var result =
          await LoginDao.login(userName: userName!, password: password!);
      NavigatorUtil.goToHome(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _jumpRegistration() async {
    // 跳转到注册账号H5页面
    Uri url = Uri.parse('https://juejin.cn/post/7398342795435982902');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
