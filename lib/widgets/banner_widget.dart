import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/utils/screen_adapter_helper.dart';

class BannerWidget extends StatefulWidget {
  final List<String> bannerList;
  const BannerWidget({Key? key, required this.bannerList}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CarouselSlider(
          items: widget.bannerList
              .map((item) => _tabImage(item, screenWidth))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: 160.px,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        // 设置指示器位置
        // left 和 right 都设置为0，是为了让指示器水平居中显示
        Positioned(left: 0, right: 0, bottom: 10, child: _indicator())
      ],
    );
  }

  Widget _tabImage(String imageUrl, double width) {
    return GestureDetector(
      onTap: () {
        // 跳转对应的页面
      },
      child: Image.network(imageUrl, width: width, fit: BoxFit.cover),
    );
  }

  _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.bannerList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key), // 这里的key对应列表的索引
          child: Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // 给颜色加透明效果的写法
                color: (Colors.white)
                    .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
