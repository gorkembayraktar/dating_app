import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/repositories/database/base_database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('LeLVFHg0YJoXJf8AyoIH')
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserImages(String imageName) async {
    print(imageName);
    String downloadUrl = await StorageRepository().downloadURL(imageName);
    print(downloadUrl);
    return _firebaseFirestore.collection('users').doc('LeLVFHg0YJoXJf8AyoIH').update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl]),
    });
  }
}
