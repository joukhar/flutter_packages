# Rounded Avatar

A customizable widget for displaying rounded avatars in Flutter applications. Supports both network and local images, including SVGs, and offers various customization options such as border color, border width, border radius, and image fit.

## Features

- **Network & Local Images**: Load avatars from the web or local assets.
- **SVG Support**: Handle SVG images effortlessly.
- **Customizable Borders**: Set border color, width, and radius.
- **Flexible Image Fit**: Control how the image is inscribed into the box.

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
            avatar: 'https://example.com/avatar.svg',  // For network SVG
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

## Screenshots

![Screenshot1][] ![Screenshot2][]## Buy Me a CoffeeIf you find this package useful, consider buying me a coffee to support further development[![Buy Me a Coffee][]][]## Additional Support### Available on Codecanyon[![Codecanyon][]](https://codecanyon.net/user/yourusername)### Available on Gumroad[![Gumroad][]](https://gumroad.com/yourusername)## Additional Information### More InformationFor more information about this package, visit the [documentation](https://github.com/your-repo/rounded_avatar).### ContributingWe welcome contributions! If you have an idea for a feature or find a bug, please open an issue or submit a pull request.1. Fork the repository.2. Create your feature branch (`git checkout -b feature/your-feature`).3. Commit your changes (`git commit -m 'Add some feature'`).4. Push to the branch (`git push origin feature/your-feature`).5. Open a pull request.### Filing IssuesIf you encounter any issues, please file them on the [GitHub issues page](https://github.com/your-repo/rounded_avatar/issues). We aim to respond to issues within 48 hours.### Response TimeOur team strives to respond to issues and pull requests within 48 hours. For urgent matters, please contact us directly through our support email.## LicenseThis project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.```### Notes:- Replace `https://github.com/your-repo/rounded_avatar.git` with the actual URL of your Git repository.- Update `https://example.com/avatar.svg` and other placeholder URLs with your actual content.- Replace `https://via.placeholder.com/150` with actual URLs for screenshots.- Update the links for Buy Me a Coffee, Codecanyon, and Gumroad with your actual profiles.- Replace the placeholders in the "More Information", "Contributing", and "Filing Issues" sections with relevant links and details.This `README.md` provides a comprehensive overview of the package, including installation, usage, screenshots, support options, and additional information for contributors and users.