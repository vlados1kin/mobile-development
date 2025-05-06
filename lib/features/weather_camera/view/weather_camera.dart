// Dart imports:
import 'dart:io';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:weather_app/features/main_navigation/providers/providers.dart';
import 'package:weather_app/features/weather_now/styles/weather_now_screen_style.dart';
import 'package:weather_app/features/weather_now/widgets/widgets.dart';

/// Экран камеры
class WeatherCamera extends StatefulWidget {
  /// Конструктор
  const WeatherCamera({required this.camera, super.key, this.style});

  /// Инстанс камеры
  final CameraDescription camera;

  /// Кастомный стиль виджета
  final WeatherNowScreenStyle? style;

  @override
  State<WeatherCamera> createState() => _WeatherCameraState();
}

class _WeatherCameraState extends State<WeatherCamera> {
  final GlobalKey _stackKey = GlobalKey();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.high);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    try {
      await _initializeControllerFuture;
      final file = await _controller.takePicture();

      setState(() {
        _imageFile = file;
      });
    } catch (e) {
      debugPrint('Error taking picture: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  void _showMenu(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconColor = Theme.of(context).iconTheme.color;
    showModalBottomSheet<Container>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera, color: iconColor),
                title: Text('Сделать фото', style: textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context); // Close the menu
                  _takePhoto(); // Open the camera and take a photo
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album, color: iconColor),
                title: Text('Выбрать из галереи', style: textTheme.bodyMedium),
                onTap: () {
                  Navigator.pop(context); // Close the menu
                  _pickImageFromGallery(); // Pick image from gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveOverlayedImage() async {
    try {
      final success = await _captureAndSaveImage();
      if (!mounted) return;
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Фото сохранено в альбом WeatherApp')),
        );
      }
    } catch (e) {
      debugPrint('Error: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ошибка при сохранении фото')),
      );
    }
  }

  Future<bool> _captureAndSaveImage() async {
    if (!await Gal.hasAccess()) {
      final granted = await Gal.requestAccess();
      if (!granted) return false;
    }

    final boundary =
        _stackKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    if (boundary.debugNeedsPaint) {
      await Future<void>.delayed(const Duration(milliseconds: 20));
      return _captureAndSaveImage(); // retry
    }

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    await Gal.putImageBytes(pngBytes, album: 'WeatherApp');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final mainWeatherData = Provider.of<WeatherProvider>(context).mainWeather!;
    final theme = Theme.of(context);

    final defaultStyle = Theme.of(context).extension<WeatherNowScreenStyle>()!;
    final textColor = widget.style?.textColor ?? defaultStyle.textColor;
    final backgroundColor =
        widget.style?.backgroundColor ?? defaultStyle.backgroundColor;
    final city =
        Provider.of<WeatherProvider>(context).currentLocation?.city ??
        'Город не найден';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Фоторежим'),
        actions: [
          if (_imageFile != null)
            IconButton(
              onPressed: _saveOverlayedImage,
              icon: Icon(Icons.save_alt_outlined, color: theme.iconTheme.color),
            ),
        ],
      ),
      body:
          _imageFile == null
              ? const Center(child: Text('Изображение не выбрано'))
              : Column(
                children: [
                  RepaintBoundary(
                    key: _stackKey,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.file(
                            File(_imageFile!.path),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                            margin: const EdgeInsets.only(left: 15),
                            height: 225,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(city, style: TextStyle(color: textColor)),
                                Text(
                                  mainWeatherData.text,
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: textColor.withAlpha(180),
                                  ),
                                ),
                                WeatherInfo(weatherData: mainWeatherData),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: () => _showMenu(context), // Show menu when pressed
        tooltip: 'Choose Image Source',
        child: Icon(Icons.add_a_photo_outlined, color: textColor),
      ),
    );
  }
}
