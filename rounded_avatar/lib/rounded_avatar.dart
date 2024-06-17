library rounded_avatar;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_avatar/helpers/avatar_helper.dart';

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
        shape: borderRadius == BorderRadius.zero ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: borderRadius == BorderRadius.zero
          ? ClipOval(child: _buildAvatar(avatar))
          : ClipRRect(borderRadius: borderRadius!, child: _buildAvatar(avatar)),
    );
  }

  Widget _buildAvatar(String avatar) {
    final bool isOnlineAvatar = AvatarHelper.isOnlineAvatar(avatar);
    // TODO ADD PLACEHOLDER AND ERROR BUILDER FOR ALL use FadeInImage or somthing else
    if (isSvg) {
      return isOnlineAvatar
          ? SvgPicture.network(
              avatar,
              fit: fit,
              headers: httpHeaders,
              placeholderBuilder: (context) => const Center(child: CircularProgressIndicator()),
              // errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            )
          : SvgPicture.asset(
              avatar,
              fit: fit,
              placeholderBuilder: (context) => const Center(child: CircularProgressIndicator()),
              // errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            );
    } else {
      return isOnlineAvatar
          ? Image.network(
              avatar,
              fit: fit,
              headers: httpHeaders,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            )
          : Image.asset(
              avatar,
              fit: fit,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            );
    }
  }
}
