import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socializz/models/memory.dart';
import 'package:socializz/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadMemories(String description, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "Some error occurred";

    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('memories', file, true);

      String memoryId = const Uuid().v1();

      Memory memory = Memory(
          description: description,
          uid: uid,
          memoryUrl: photoUrl,
          username: username,
          memoryId: memoryId,
          datePublished: DateTime.now(),
          profileImage: profileImage,
          likes: []);

      _firestore.collection('memories').doc(memoryId).set(memory.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}