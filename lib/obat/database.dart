import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('apotek');

class DatabaseO {
//Tambah Data Obat
  static Future<void> addItem({
    String kode,
    String name,
    String jenis,
    int harga,
    int stok,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('obat').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "name": name,
      "jenis": jenis,
      "harga": harga,
      "stok": stok,
    };
stok = stok;
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Data Obat berhasil ditambahkan"))
        .catchError((e) => print(e));
  }
//update Data Obat
  static Future<void> updateItem({
    String kode,
    String name,
    String jenis,
    int harga,
    int stok,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('obat').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "name": name,
      "jenis": jenis,
      "harga": harga,
      "stok": stok,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Data Obat berhasil diupdate"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('obat');

    return notesItemCollection.orderBy('name').snapshots();
  }
//hapus Data Obat
  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('obat').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Data Obat berhasil dihapus'))
        .catchError((e) => print(e));
  }
}
