import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

enum UserRole { client, vendor }

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
    required UserRole role,
    required DateTime createdAt,
  }) = _AppUser;
}
