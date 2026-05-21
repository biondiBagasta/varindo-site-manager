import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class MainMenuShimmer extends StatelessWidget {

  const MainMenuShimmer({ super.key, required this.dataLength });

  final int dataLength;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final screenWidth = constrains.maxWidth;

        return Wrap(
          alignment: WrapAlignment.center,
          spacing: screenWidth * 0.04,
          runSpacing: 12,
          children: [
            for(var i = 0; i < dataLength; i++) Shimmer.fromColors(
              baseColor: Colors.grey[400]!, 
              highlightColor: Colors.grey[100]!,
              child: SizedBox(
                width: screenWidth * 0.16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.14,
                      height: screenWidth * 0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 8,),
                  ],
                ),
              )
            )
          ]
        );
      }
    );
  }
}