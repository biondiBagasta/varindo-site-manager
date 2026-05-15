import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PromoCarousel extends StatelessWidget {

  const PromoCarousel({ super.key });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context2, index, pageIndex) {
          return Container(
            width: constantScreenWidth,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/CAROUSEL-${index + 1}.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(18)),
          );
        },
        options: CarouselOptions(
          viewportFraction: 1,
          height: 150,
          autoPlay: true,
          onPageChanged: (index, reason) {

          }
        )
    );
  }
}