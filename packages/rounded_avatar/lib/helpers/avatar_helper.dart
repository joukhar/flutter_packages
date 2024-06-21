/// AvatarHelper provides utility functions and methods for avatars
class AvatarHelper {
  /// Online Avatar check | Support http/https
  static bool isOnlineAvatar(String avatar) {
    return avatar.startsWith('http');
  }

  /// Check if svg is raw string
  static bool isRawSvg(String avatar) {
    return avatar.startsWith('<svg');
  }
}
