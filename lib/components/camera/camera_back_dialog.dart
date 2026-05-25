import "package:camera/camera.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/camera/camera_back_screen.dart";
import "package:varindo_estate_management/components/snackbars/show_error_snackbar.dart";

class CameraBackDialog extends StatefulWidget {
  const CameraBackDialog({super.key});

  @override
  State<CameraBackDialog> createState() => _CameraBackDialogState();
}

class _CameraBackDialogState extends State<CameraBackDialog> {
  late List<CameraDescription> _cameras;
  CameraController? _controller;
  int _cameraIndex = 0;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();

    // default → back camera
    _cameraIndex = _cameras.indexWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
    );
    if (_cameraIndex < 0) _cameraIndex = 0;

    await _startCamera(_cameraIndex);
  }

  Future<void> _startCamera(int index) async {
    setState(() => _isReady = false);

    await _controller?.dispose();

    _controller = CameraController(
      _cameras[index],
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller!.initialize();
      if (mounted) setState(() => _isReady = true);
    } on CameraException catch (_) {
      if (mounted) {
        showErrorSnackBar(
          context,
          "ERROR",
          "Anda harus mengizinkan applikasi untuk mengakses kamera anda.",
        );
        Navigator.pop(context);
      }
    }
  }


  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;

    final file = await _controller!.takePicture();

    if (mounted) {
      Navigator.pop(context, XFile(file.path));
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady || _controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return CameraBackScreen(
      cameraController: _controller!,
      onTakePicture: _takePicture,
    );
  }
}