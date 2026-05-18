import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class CustomLAppbarBackLight extends StatelessWidget implements PreferredSizeWidget {

  const CustomLAppbarBackLight({ super.key, required this.title });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: lightMainSystemOverlay,
      backgroundColor: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      centerTitle: true,
      elevation: 1,
      scrolledUnderElevation: 1,
      title: MainTextComponent(fontSize: 16, fontWeight: FontWeight.w700, text: title,),
      leading: IconButton(
        onPressed: () {
          context.pop();
        }, 
        icon: Icon(LucideIcons.arrowLeft, color: HexColor.fromHex(kTextColor),)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}