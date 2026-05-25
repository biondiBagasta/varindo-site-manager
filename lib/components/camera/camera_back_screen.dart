import "package:camera/camera.dart";
import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:go_router/go_router.dart";
import "package:varindo_estate_management/utils/utils.dart";

class CameraBackScreen extends StatelessWidget {

  const CameraBackScreen({ super.key, required this.cameraController, required this.onTakePicture });

  final CameraController cameraController;
  final Function onTakePicture;

  @override
  Widget build(BuildContext context) {
    return CameraPreview(
      cameraController,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  }, 
                  icon: Icon(Iconsax.close_circle5, size: 36, color: Colors.black.withAlpha(80),)
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                onTakePicture();
              },
              child: CircleAvatar(
                radius: 36,
                backgroundColor: HexColor.fromHex(kBackgroundColor),
                child: Icon(Icons.photo_camera, size: 36, color: HexColor.fromHex(kTextColor),),
              )
            )
          ],
        ),
      ),
    );
  }
}