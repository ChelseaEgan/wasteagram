import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/firebase/post_entry_dto.dart';

class DataStorage {
  static void uploadData({PostEntryDTO dto}) {
    Firestore.instance.collection('posts').add({
      'date': dto.date,
      'imageURL': dto.imageURL,
      'quantity': dto.quantity,
      'latitude': dto.latitude,
      'longitude': dto.longitude
    });
  }

  static Stream<QuerySnapshot> getPostSnapshots() =>
      Firestore.instance.collection('posts').snapshots();
}
