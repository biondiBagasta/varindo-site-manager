import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/components/texts/stroked_main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class SignInCarousel extends StatefulWidget {

  const SignInCarousel({ super.key });

  @override
  State<SignInCarousel> createState() => _SignInCarouselState();
}

class _SignInCarouselState extends State<SignInCarousel> {

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
              padding: EdgeInsets.all(12),
              width: constantScreenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/CAROUSEL-${index + 1}.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor.fromHex(kPrimaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(6),
                    child: MainTextComponent(text: "New Development", fontSize: 12, fontWeight: FontWeight.w400, isWhite: true,),
                  ),
                  SizedBox(height: 8,),
                  StrokedMainTextComponent(
                    text: "Grand Natura", 
                    fontSize: 16, 
                    fontWeight: FontWeight.w600,
                    isWhite: true,
                  ),
                  SizedBox(height: 6,),
                  StrokedMainTextComponent(text: "Premium Residental Living Space", fontSize: 14, fontWeight: FontWeight.w500, isWhite: true,)
                ],
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 0.86,
            height: 192,
            autoPlay: false,
            padEnds: false,
            disableCenter: true,
            enableInfiniteScroll: false,
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