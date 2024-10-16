import 'package:flutter/material.dart';
import 'package:trip_app/dao/login_dao.dart';
import 'package:trip_app/utils/navigator_util.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get _logoutBtn => ElevatedButton(
      onPressed: () => LoginDao.logOut(), child: const Text('登出'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        backgroundColor: Colors.blue,
        actions: [_logoutBtn],
      ),
    );
  }
}
