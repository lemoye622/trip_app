import 'package:flutter/material.dart';
import 'package:trip_app/pages/home.dart';
import 'package:trip_app/pages/my_page.dart';
import 'package:trip_app/pages/search.dart';
import 'package:trip_app/pages/travel.dart';
import 'package:trip_app/utils/navigator_util.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 更新导航器的context， 供退出登录时使用
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(), // 禁用滚动
        children: const [
          Home(),
          Search(),
          Travel(),
          MyPage(),
        ],
      ),
      // 自定义底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: [
          _tabItem('首页', Icons.home, 0),
          _tabItem('搜索', Icons.search, 1),
          _tabItem('旅拍', Icons.camera_alt, 2),
          _tabItem('我的', Icons.account_circle, 3),
        ],
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  _tabItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _defaultColor),
      activeIcon: Icon(icon, color: _activeColor),
      label: title
    );
  }
}
