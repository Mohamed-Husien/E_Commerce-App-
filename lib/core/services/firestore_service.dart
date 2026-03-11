import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({required String path, String? documentId}) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDocumentExists(
      {required String path, required String documentId}) {
    return firestore
        .collection(path)
        .doc(documentId)
        .get()
        .then((doc) => doc.exists);
  }
}
