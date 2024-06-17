class AvatarHelper {
  /// Online Avatar check
  /// Support http/https
  static bool isOnlineAvatar(String avatar) {
    return avatar.startsWith('http');
  }
}
