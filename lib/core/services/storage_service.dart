import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

abstract class StorageService {
  Future<String> uploadImage({required Uint8List bytes, required String path});
}

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  final FirebaseStorage _storage;

  StorageServiceImpl(this._storage);

  @override
  Future<String> uploadImage({
    required Uint8List bytes,
    required String path,
  }) async {
    final ref = _storage.ref().child(path);
    final snapshot = await ref.putData(
      bytes,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    return snapshot.ref.getDownloadURL();
  }
}
