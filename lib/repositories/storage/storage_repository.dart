import 'dart:io';

import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:dating_app/repositories/storage/base_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    try {
      print(image.path);
      // Extract the original filename (if available)
      final filename = image.name ?? image.path.split('/').last;

      // Create a unique filename to avoid conflicts and improve organization
      final uniqueFilename =
          '${DateTime.now().millisecondsSinceEpoch}_$filename';

      await storage.ref('user_1/${uniqueFilename}')
          .putFile(File(image.path))
          .then(
          (p0) => DatabaseRepository().updateUserImages(uniqueFilename).then((value) => print('success')).catchError((err) => print(err))
      );
    } catch (_) {}
  }

  @override
  Future<String> downloadURL(String imageName) async {
    String downloadUrl =
        await storage.ref('user_1/$imageName').getDownloadURL();
    return downloadUrl;
  }
}
