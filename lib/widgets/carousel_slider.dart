import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_color_provider.dart';

class CarouselSlider extends StatefulWidget {
  final List<Widget> items;
  final double height;

  const CarouselSlider({super.key, required this.items, required this.height});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          final colorProvider =
              Provider.of<CardColorProvider>(context, listen: false);
          colorProvider.changeColor(index % widget.items.length);
        },
        itemBuilder: (context, index) {
          return widget.items[index % widget.items.length];
        },
      ),
    );
  }
}
