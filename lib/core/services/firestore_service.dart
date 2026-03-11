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
  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return [data.data()!];
    }

    Query<Map<String, dynamic>> data = firestore.collection(path);

    if (query != null) {
      if (query['orderBy'] != null) {
        data = data.orderBy(
          query['orderBy'],
          descending: query['descending'] ?? false,
        );
      }

      if (query['limit'] != null) {
        data = data.limit(query['limit']);
      }
    }

    var result = await data.get();

    return result.docs.map((doc) => doc.data()).toList();
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
