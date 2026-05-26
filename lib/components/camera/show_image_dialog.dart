import "dart:io";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

void showFileImageDialog(BuildContext context, File file) {
  showDialog(
    context: context, 
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            InteractiveViewer(
              panEnabled: false,
              minScale: 0.5,
              maxScale: 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(file.path), fit: BoxFit.cover,
                )
              )
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(10, -10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      );
    }
  );
}

void showUrlImageDialog(BuildContext context, String url) {
  showDialog(
    context: context, 
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            InteractiveViewer(
              panEnabled: false,
              minScale: 0.5,
              maxScale: 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                  )
              )
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(10, -10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      );
    }
  );
}