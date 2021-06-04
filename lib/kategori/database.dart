import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('kategori');

class Database {
//Tambah kategori
  static Future<void> addItem({
    String name,
    String description,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Kategori berhasil ditambahkan"))
        .catchError((e) => print(e));
  }
//update kategori
  static Future<void> updateItem({
    String name,
    String description,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Kategori berhasil diupdate"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }
//hapus kategori
  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Kategori berhasil dihapus'))
        .catchError((e) => print(e));
  }
}
