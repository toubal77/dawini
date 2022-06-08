import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawini/services/database.dart';

class FirestoreDatabase implements Database {
  @override
  String getUniqueId() {
    // ignore: no_leading_underscores_for_local_identifiers
    final String _randomId =
        FirebaseFirestore.instance.collection(' ').doc().id;
    return _randomId;
  }

  // @override
  // Future<String> uploadFile({
  //   required String path,
  //   required String filePath,
  // }) async {
  //   // Create a Reference to the file
  //   final Reference ref = FirebaseStorage.instance.ref(path);

  //   final UploadTask uploadTask = ref.putFile(File(filePath));
  //   final TaskSnapshot storageTaskSnapshot =
  //       await uploadTask.whenComplete(() {});
  //   final String result = await storageTaskSnapshot.ref.getDownloadURL();
  //   return result;
  // }

  @override
  Future<T?> fetchDocument<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String id) builder,
  }) async {
    final DocumentReference<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.doc(path);
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await reference.get();

    if (snapshot.data() != null) {
      return builder(
        snapshot.data()!,
        snapshot.id,
      );
    } else {
      return null;
    }
  }

  @override
  Stream<T?> streamDocument<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String id) builder,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.data() == null) return null;
      return builder(snapshot.data()!, snapshot.id);
    });
  }

  @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final dcumentReference = FirebaseFirestore.instance.doc(path);
    // ignore: avoid_print
    print('set $path: $data');
    await dcumentReference.set(data, SetOptions(merge: merge));
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final dcumentReference = FirebaseFirestore.instance.doc(path);
    // ignore: avoid_print
    print('set $path: $data');
    await dcumentReference.update(data);
  }

  @override
  Future<void> addDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection(path);

    // ignore: avoid_print
    print('created ${collectionReference.path}: $data');
    await collectionReference.add(data);
  }

  @override
  Future<List<T>> fetchCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String id) builder,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

    if (snapshot.docs.isNotEmpty) {
      final List<T> result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .toList();

      if (sort != null) {
        result.sort(sort);
      }

      return result;
    } else {
      return [];
    }
  }

  @override
  Stream<List<T>> streamCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        query.snapshots();
    return snapshots.map((snapshot) {
      //
      final List<T> result = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
        return builder(snapshot.data(), snapshot.id);
      }).toList();

      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  @override
  Future<void> deleteDocument({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    // ignore: avoid_print
    print('delete: $path');
    await reference.delete();
  }
}
