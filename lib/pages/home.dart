import 'package:flutter/material.dart';
import 'package:trip_app/dao/login_dao.dart';
import 'package:trip_app/widgets/banner_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final bannerList = [
    'https://wx1.sinaimg.cn/mw690/005x3T92ly1hrfa3mkow1j31kw1kw49y.jpg',
    'https://ww2.sinaimg.cn/mw690/006BEoGsgy1hrpxat0f93j33c03c04qu.jpg',
    'https://ww1.sinaimg.cn/mw690/0069nLB9gy1hr6jux97ihj30wi0wi7b0.jpg',
    'https://img1.baidu.com/it/u=3039218459,304779170&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1198',
    'https://img2.baidu.com/it/u=1733822578,1811991299&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067'
  ];

  get _logoutBtn => ElevatedButton(
      onPressed: () => LoginDao.logOut(), child: const Text('登出'));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        backgroundColor: Colors.blue,
        actions: [_logoutBtn],
      ),
      body: Column(
        children: [BannerWidget(bannerList: bannerList)],
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
