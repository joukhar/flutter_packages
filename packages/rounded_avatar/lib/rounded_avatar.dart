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

  const RoundedAvatar({
    super.key,
    required this.avatar,
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
