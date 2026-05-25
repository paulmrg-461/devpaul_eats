import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUserModel {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;
  final UserRole role;
  final DateTime createdAt;

  const AppUserModel({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
    required this.role,
    required this.createdAt,
  });

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      role: _roleFromString(json['role'] as String? ?? 'client'),
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.tryParse(json['createdAt'] as String? ?? '') ??
              DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'role': _roleToString(role),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory AppUserModel.fromFirebaseUser(
    User user, {
    required String name,
    required UserRole role,
  }) {
    return AppUserModel(
      id: user.uid,
      email: user.email ?? '',
      name: name,
      photoUrl: user.photoURL,
      role: role,
      createdAt: DateTime.now(),
    );
  }

  AppUser toEntity() {
    return AppUser(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
      role: role,
      createdAt: createdAt,
    );
  }

  static UserRole _roleFromString(String value) {
    switch (value) {
      case 'vendor':
        return UserRole.vendor;
      case 'client':
      default:
        return UserRole.client;
    }
  }

  static String _roleToString(UserRole role) {
    switch (role) {
      case UserRole.vendor:
        return 'vendor';
      case UserRole.client:
        return 'client';
    }
  }
}
