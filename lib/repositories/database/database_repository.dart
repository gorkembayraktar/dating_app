import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/repositories/database/base_database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserImages(User user, String imageName) async {
    print(imageName);
    String downloadUrl = await StorageRepository().downloadURL(user, imageName);
    print(downloadUrl);
    return _firebaseFirestore.collection('users').doc(user.id).update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl]),
    });
  }

  @override
  Future<void> UpdateUser(User user) async {
    return _firebaseFirestore
        .collection("users")
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print(' user doc updated'));
  }

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toMap())
        .then((value) {
      print('create user updated ');
    });
  }
}
