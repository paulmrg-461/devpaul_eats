import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

abstract class StorageService {
  /// Uploads [file] to [path] in Firebase Storage and returns its download URL.
  Future<String> uploadImage({required File file, required String path});
}

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  final FirebaseStorage _storage;

  StorageServiceImpl(this._storage);

  @override
  Future<String> uploadImage({
    required File file,
    required String path,
  }) async {
    final ref = _storage.ref().child(path);
    final snapshot = await ref.putFile(file);
    return snapshot.ref.getDownloadURL();
  }
}
