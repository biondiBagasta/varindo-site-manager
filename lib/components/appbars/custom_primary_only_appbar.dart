import "package:flutter/material.dart";
import "package:varindo_estate_management/utils/utils.dart";

class CustomPrimaryOnlyAppbar extends StatelessWidget implements PreferredSizeWidget {

  const CustomPrimaryOnlyAppbar({ super.key });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: mainSystemOverlay,
      backgroundColor: HexColor.fromHex(kPrimaryColor),
      centerTitle: true,
      toolbarHeight: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}