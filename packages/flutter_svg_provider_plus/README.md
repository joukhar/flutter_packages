# flutter_svg_provider_plus

#### This is a fork from [flutter_svg_provider](https://pub.dev/packages/flutter_svg_provider) with some improvements

A Flutter package for using svg in `Image` widget via custom `ImageProvider`.

Svg is parsed using flutter_svg dependency.

## Getting started

```dart
import 'package:flutter_svg_provider_plus/flutter_svg_provider_plus.dart';

final localSvg = Image(
  width: 32,
  height: 32,
  image: Svg('assets/my_icon.svg'),
)
final rawSvg = Image(
  width: 32,
  height: 32,
  image: Svg('<svg>...</svg>', source: SvgSource.raw),
)
final networkSvg = Image(
  width: 32,
  height: 32,
  image: Svg('https://...', source: SvgSource.network, httpHeaders: {}),
)
```
