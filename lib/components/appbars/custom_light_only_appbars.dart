import "package:flutter/material.dart";
import "package:varindo_estate_management/utils/utils.dart";

class CustomLightOnlyAppbar extends StatelessWidget implements PreferredSizeWidget {

  const CustomLightOnlyAppbar({ super.key });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: lightMainSystemOverlay,
      backgroundColor: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      centerTitle: true,
      toolbarHeight: 0,
      elevation: 1,
      scrolledUnderElevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}