import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = "#315C49";
const kSecondaryColor = "#A41E23";
const kInfoColor = "#45aaf2";
const kBackgroundColor = "#F6F8FA";
const kGradientColor1 = "#1CAB4F";
const kGradientColor2 = "#3EB24D";
const kGradientColor3 = "#42B44D";
const kLightTextColor ="#6B7280";
const kSuccessColor = "#1abc9c";
const kErrorColor = "#c5000f";

const kTextColor = "#2d3436";

final mainSystemOverlay = SystemUiOverlayStyle(
  statusBarColor: HexColor.fromHex(kPrimaryColor),
  systemNavigationBarColor: Colors.white,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: Colors.white
);

final lightMainSystemOverlay = SystemUiOverlayStyle(
  statusBarColor: HexColor.fromHex(kBackgroundColor),
  systemNavigationBarColor: Colors.black,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.white
);

final double constantScreenWidth = WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  
final double constantScreenHeight = WidgetsBinding
              .instance.platformDispatcher.views.first.physicalSize.height /
          WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

extension HexColor on Color {
  /// Create a Color from a hex code string like "#aabbcc" or "ffaabbcc".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Convert a Color to hex string. Adds "#" by default.
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${a.toInt().toRadixString(16).padLeft(2, '0')}'
      '${r.toInt().toRadixString(16).padLeft(2, '0')}'
      '${g.toInt().toRadixString(16).padLeft(2, '0')}'
      '${b.toInt().toRadixString(16).padLeft(2, '0')}';
}

class FormatCurrency {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: decimalDigit
    );

    return currencyFormat.format(number);
  }
}

// Bagian Server
const urlAuth = "desktop/api";
const urlCore = "apimpn/apps/v9";
const urlV8 = "apimpn/apps/v8";
const urlSocket = "desktop";
const urlFile = "desktop/api/files";
const urlCustomBiller = "9111/api";
const urlDynamicBiller = "payment/api";
const urlCoreMPN = "apimpn/apps/v9";

const appVersionName = "ADAMULTI-ANDROID-GANJIL";


const serverList = [
  "https://app.adamulti.com/",
  "https://app.ada8kurir.com/",
];

const serverListName = [
  "Server 1",
  "Server 2"
];

String formatDateToIndonesian(DateTime date) {
  return DateFormat(
    'd MMMM yyyy',
    'id_ID',
  ).format(DateTime.parse('2026-05-27 00:00:00.000'));
}

Future<CroppedFile?> cropFileFunction(String path) {
  return ImageCropper().cropImage(
    sourcePath: path,
    uiSettings: [
      AndroidUiSettings(
        lockAspectRatio: true,
        toolbarTitle: 'Cropper',
        toolbarColor: HexColor.fromHex(kPrimaryColor),
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
      ),
      IOSUiSettings(
        title: 'Cropper',
        aspectRatioLockEnabled: true,
        aspectRatioLockDimensionSwapEnabled: false,
        aspectRatioPresets: [
          CropAspectRatioPreset.square, // IMPORTANT: iOS supports only one custom aspect ratio in preset list
        ],
      ),
    ],
  );
}