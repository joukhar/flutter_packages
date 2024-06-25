library rounded_avatar;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_avatar/helpers/avatar_helper.dart';

/// RoundedAvatar is a customizable Flutter widget for rounded avatars,
/// supporting network and local images, including SVGs,
/// with border customizations and more options.
class RoundedAvatar extends StatelessWidget {
  final String avatar;
  final double width;
  final double height;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool isSvg;
  final Map<String, String>? httpHeaders;
  final Widget placeholder;
  final Alignment alignment;
  final Color? color;
  final BlendMode? blendMode;

  const RoundedAvatar(
    this.avatar, {
    super.key,
    required this.width,
    required this.height,
    this.borderColor,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth,
    this.fit = BoxFit.cover,
    this.isSvg = false,
    this.httpHeaders,
    this.placeholder = const SizedBox(),
    this.alignment = Alignment.center,
    this.color,
    this.blendMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: borderWidth == null ? null : EdgeInsets.all(borderWidth!),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: borderRadius == BorderRadius.zero ? null : borderRadius,
        shape: borderRadius == BorderRadius.zero
            ? BoxShape.circle
            : BoxShape.rectangle,
      ),
      child: borderRadius == BorderRadius.zero
          ? ClipOval(child: _buildAvatar(avatar))
          : ClipRRect(borderRadius: borderRadius!, child: _buildAvatar(avatar)),
    );
  }

  /// Build avatar widget
  Widget _buildAvatar(String avatar) {
    final bool isOnlineAvatar = AvatarHelper.isOnlineAvatar(avatar);
    if (isSvg) {
      return isOnlineAvatar
          ? SvgPicture.network(
              avatar,
              fit: fit,
              headers: httpHeaders,
              alignment: alignment,
              colorFilter: color != null && blendMode != null
                  ? ColorFilter.mode(color!, blendMode!)
                  : null,
              placeholderBuilder: (context) => placeholder,
            )
          : AvatarHelper.isRawSvg(avatar)
              ? SvgPicture.string(
                  avatar,
                  fit: fit,
                  alignment: alignment,
                  colorFilter: color != null && blendMode != null
                      ? ColorFilter.mode(color!, blendMode!)
                      : null,
                  placeholderBuilder: (context) => placeholder,
                )
              : SvgPicture.asset(
                  avatar,
                  fit: fit,
                  alignment: alignment,
                  colorFilter: color != null && blendMode != null
                      ? ColorFilter.mode(color!, blendMode!)
                      : null,
                  placeholderBuilder: (context) => placeholder,
                );
    } else {
      return isOnlineAvatar
          ? Image.network(
              avatar,
              fit: fit,
              headers: httpHeaders,
              alignment: alignment,
              color: color,
              colorBlendMode: blendMode,
              errorBuilder: (context, error, stackTrace) => placeholder,
            )
          : Image.asset(
              avatar,
              fit: fit,
              alignment: alignment,
              color: color,
              colorBlendMode: blendMode,
              errorBuilder: (context, error, stackTrace) => placeholder,
            );
    }
  }
}

/* ---------------------------------------------------------------------------------------------- */
/* Example With Svg Provider But It Svg Quality Is Disappointing                                  */
/* ---------------------------------------------------------------------------------------------- */

// library rounded_avatar;

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg_provider_plus/flutter_svg_provider_plus.dart';

// /// An [Enum] of the possible avatar path sources.
// enum AvatarSource {
//   file,
//   asset,
//   network,
//   fileSvg,
//   assetSvg,
//   networkSvg,
//   rawSvg,
// }

// /// RoundedAvatar is a customizable Flutter widget for rounded avatars,
// /// supporting network and local images, including SVGs,
// /// with border customizations and more options.
// class RoundedAvatar extends StatelessWidget {
//   final String avatar;
//   final AvatarSource source;
//   final double width;
//   final double height;
//   final Color? borderColor;
//   final double? borderWidth;
//   final BorderRadiusGeometry? borderRadius;
//   final BoxFit fit;
//   final ImageRepeat repeat;
//   final Map<String, String>? httpHeaders;
//   final Alignment alignment;
//   final Color? color;
//   final BlendMode? blendMode;
//   final Widget Function(BuildContext context, Object error, StackTrace? stack)? errorBuilder;
//   final Widget Function(BuildContext context, Widget child, ImageChunkEvent? loadingProgress)?
//       loadingBuilder;

//   const RoundedAvatar(
//     this.avatar, {
//     super.key,
//     required this.width,
//     required this.height,
//     required this.source,
//     this.borderColor,
//     this.borderRadius = BorderRadius.zero,
//     this.borderWidth,
//     this.fit = BoxFit.cover,
//     this.repeat = ImageRepeat.noRepeat,
//     this.httpHeaders,
//     this.alignment = Alignment.center,
//     this.color,
//     this.blendMode,
//     this.errorBuilder,
//     this.loadingBuilder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       padding: borderWidth == null ? null : EdgeInsets.all(borderWidth!),
//       decoration: BoxDecoration(
//         color: borderColor,
//         borderRadius: borderRadius == BorderRadius.zero ? null : borderRadius,
//         shape: borderRadius == BorderRadius.zero ? BoxShape.circle : BoxShape.rectangle,
//       ),
//       child: borderRadius == BorderRadius.zero
//           ? ClipOval(child: _buildAvatar(avatar))
//           : ClipRRect(borderRadius: borderRadius!, child: _buildAvatar(avatar)),
//     );
//   }

//   /// Build avatar widget
//   Widget _buildAvatar(String avatar) {
//     return Image(
//       image: getAvatarProvider(),
//       fit: fit,
//       repeat: repeat,
//       alignment: alignment,
//       color: color,
//       colorBlendMode: blendMode,
//       errorBuilder: errorBuilder,
//       loadingBuilder: loadingBuilder,
//     );
//   }

//   ImageProvider getAvatarProvider() {
//     switch (source) {
//       case AvatarSource.file:
//         return FileImage(File(avatar));
//       case AvatarSource.asset:
//         return AssetImage(avatar);
//       case AvatarSource.network:
//         return NetworkImage(avatar, headers: httpHeaders);
//       case AvatarSource.rawSvg:
//         return Svg(avatar, source: SvgSource.raw);
//       case AvatarSource.networkSvg:
//         return Svg(avatar, source: SvgSource.network, httpHeaders: httpHeaders);
//       case AvatarSource.assetSvg:
//         return Svg(avatar, source: SvgSource.asset);
//       case AvatarSource.fileSvg:
//         return Svg(avatar, source: SvgSource.file);
//       default:
//         throw Exception("Unknown avatar source: $source");
//     }
//   }
// }
