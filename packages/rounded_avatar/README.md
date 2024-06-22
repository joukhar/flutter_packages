# Rounded Avatar

A customizable widget for displaying rounded avatars in Flutter applications. Supports both network and local images, including SVGs, and offers various customization options such as border color, border width, border radius, and image fit.

## Features

- **Network & Local Images**: Load avatars from the web or local assets.
- **SVG Support**: Handle SVG images effortlessly.
- **Customizable Borders**: Set border color, width, and radius.
- **Flexible Image Fit**: Control how the image is inscribed into the box.

## Screenshots

<img src="https://raw.githubusercontent.com/joukhar/flutter_packages/main/packages/rounded_avatar/screenshots/preview.png" alt="project-preview" title="project-preview">

## Installation

Add the following to your `pubspec.yaml`:
```yaml
dependencies:
  rounded_avatar: ^1.0.0
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:rounded_avatar/rounded_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Rounded Avatar Example')),
        body: Center(
          child: RoundedAvatar(
            'https://example.com/avatar.svg',  // For network SVG
            width: 100.0,
            height: 100.0,
            borderColor: Colors.blue,
            borderWidth: 2.0,
            borderRadius: BorderRadius.circular(50.0),  // Circle if zero, otherwise rectangle
            fit: BoxFit.cover,
            isSvg: true,
            httpHeaders: {'Authorization': 'Bearer token'},
          ),
        ),
      ),
    );
  }
}
```

## Sponsor: Gamify UI Kit

<a href="#" target="_blank"><img src="https://raw.githubusercontent.com/joukhar/flutter_packages/main/assets/sponsor/gamify-ui-kit.png" alt="Gamify UI Kit" ></a>

<div align="center">
    <a href="https://codecanyon.net/item/gamify-ui-kit-flutter-ui-kit/52802872" target="_blank" >
        <img src="https://raw.githubusercontent.com/joukhar/flutter_packages/main/assets/sponsor/codecanyon.png" alt="Gamify ui kit - Codecanyon" title="Gamify ui kit - Codecanyon" width="47%">
    </a>
    <a href="https://joukhar.gumroad.com/l/gamify-ui-kit" target="_blank" >
        <img src="https://raw.githubusercontent.com/joukhar/flutter_packages/main/assets/sponsor/gumroad.png" alt="Gamify ui kit - Gumroad" title="Gamify ui kit - Gumroad" width="47%">
    </a>
</div>

## Support

If you find this package useful, consider buying me a coffee to support further development.

<a href="https://www.buymeacoffee.com/joukhar" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" title="Buy Me A Coffee" height="60" width="217"></a>

<a href="https://www.buymeacoffee.com/joukhar" target="_blank"><img src="https://raw.githubusercontent.com/joukhar/flutter_packages/main/assets/buymecoffee_qr.png" alt="Buy Me A Coffee" title="Buy Me A Coffee" width="217"></a>

## 🛡️ License

This project is licensed under the Apache License 2.0