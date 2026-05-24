import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:varindo_estate_management/components/texts/stroked_main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class GalleryUnitCarousel extends StatefulWidget {

  const GalleryUnitCarousel({ super.key });

  @override
  State<GalleryUnitCarousel> createState() => _GalleryUnitCarouselState();
}

class _GalleryUnitCarouselState extends State<GalleryUnitCarousel> {

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
                borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StrokedMainTextComponent(text: "FOTO FASAD", fontSize: 14, fontWeight: FontWeight.w400, isWhite: true,),
                  SizedBox(height: 4,),
                  StrokedMainTextComponent(text: "Gallery Unit A-12", fontSize: 16, fontWeight: FontWeight.w600, isWhite: true,)
                ],
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            height: 180,
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