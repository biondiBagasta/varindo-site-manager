import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";
import "package:varindo_estate_management/components/others/adamulti/main_menu_shimmer.dart";

class MoreScreenShimmer extends StatelessWidget {

  const MoreScreenShimmer({ super.key });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final screenWidth = constrains.maxWidth;

        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[400]!, 
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: screenWidth,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18)
                    ),
                  ),
                ),
                const SizedBox(height: 2,),
                const Divider(),
                const SizedBox(height: 2,),
                const MainMenuShimmer(dataLength: 10)
              ],
            ),
          ),
        );
      }
    );
  }
}