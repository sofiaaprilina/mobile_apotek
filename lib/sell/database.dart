import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('penjualan');

class Database {
//Tambah Data Obat
  static Future<void> addItem({
    String kode,
    Timestamp tanggal,
    String obat,
    int price,
    int jumlah,
    int total,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();
  
    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "tanggal": tanggal,
      "obat": obat,
      "price": price,
      "jumlah": jumlah,
      "total": total,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Data Penjualan berhasil ditambahkan"))
        .catchError((e) => print(e));
  }
//update Data Obat
  static Future<void> updateItem({
    String kode,
    Timestamp tanggal,
    String obat,
    int price,
    int jumlah,
    int total,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);
   
    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "tanggal": tanggal,
      "obat": obat,
      "price": price,
      "jumlah": jumlah,
      "total": total,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Data Penjualan berhasil diupdate"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }
//hapus Data Obat
  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Data Penjualan berhasil dihapus'))
        .catchError((e) => print(e));
  }
}
