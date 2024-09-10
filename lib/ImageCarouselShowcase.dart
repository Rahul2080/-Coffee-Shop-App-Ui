import 'package:flutter/material.dart';
import 'dart:math';
import 'Home.dart'; //

class CustomImageCarousel extends StatefulWidget {
  final Function(int val) onPageChange;
  final List<Coffee> coffeeList;

  const CustomImageCarousel({
    super.key,
    required this.onPageChange,
    required this.coffeeList,
  });

  @override
  _CustomImageCarouselState createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  double viewPortFraction = 0.5;

  late PageController pageController;

  int currentPage = 2;
  double page = 2.0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 300,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  page = pageController.page!;
                });
              }
              return true;
            },
            child: PageView.builder(
              onPageChanged: (pos) {
                setState(() {
                  currentPage = pos;
                });
                widget.onPageChange(pos);
              },
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: widget.coffeeList.length,
              itemBuilder: (context, index) {
                final scale = max(SCALE_FRACTION,
                    (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                return imageWidget(widget.coffeeList[index].image, scale);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 350,
        )
      ],
    );
  }

  Widget imageWidget(String image, double scale) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(
            height: PAGER_HEIGHT * scale,
            width: 100 * scale,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 5,
            width: 50 * scale,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          )
        ],
      ),
    );
  }
}

const SCALE_FRACTION = 0.7;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 190.0;
