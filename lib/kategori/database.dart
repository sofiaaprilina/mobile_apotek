import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('apotek');

class Database {
//Tambah kategori
  static Future<void> addItem({
    String kode,
    String name,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "name": name,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Kategori berhasil ditambahkan"))
        .catchError((e) => print(e));
  }
//update kategori
  static Future<void> updateItem({
    String kode,
    String name,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "name": name,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Kategori berhasil diupdate"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('kategori');

    return notesItemCollection.orderBy('kode').snapshots();
  }
//hapus kategori
  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Kategori berhasil dihapus'))
        .catchError((e) => print(e));
  }
}
