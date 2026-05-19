import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PromoCarousel extends StatefulWidget {

  const PromoCarousel({ super.key });

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {

  int currentIndicatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
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
              setState(() {
                currentIndicatorIndex = index;
              });
            }
          )
        ),
        SizedBox(height: 12,),
        AnimatedSmoothIndicator(
          activeIndex: currentIndicatorIndex, 
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4),
            activeDotColor: HexColor.fromHex(kPrimaryColor)
          ),
        )
      ],
    );
  }
}