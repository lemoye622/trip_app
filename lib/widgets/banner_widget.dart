import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/utils/screen_adapter_helper.dart';

class BannerWidget extends StatefulWidget {
  final List<String> bannerList; 
  const BannerWidget({ Key? key, required this.bannerList }) : super(key: key);

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
          items: widget.bannerList.map((item) => _tabImage(item, screenWidth)).toList(), 
          carouselController: _controller,
          options: CarouselOptions(
            height: 160.px,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            }
          ),
        )
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
}