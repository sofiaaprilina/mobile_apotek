import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/login/color.dart';
import 'edit_screen.dart';
import 'database.dart';
import 'package:intl/intl.dart';

class ItemPenjualan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String kode = noteInfo['kode'];
              Timestamp tanggal = noteInfo['tanggal'];
              String obat = noteInfo['obat'];
              int price = noteInfo['price'];
              int jumlah = noteInfo['jumlah'];
              int total = noteInfo['total'];

              return Ink(
                decoration: BoxDecoration(
                  color: ColorPalette.hintColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentKode: kode,
                        currentTanggal: tanggal,
                        currentObat: obat,
                        currentPrice: price,
                        currentJumlah: jumlah,
                        currentTotal: total,
                        documentId: docID,
                      ),
                    ),
                  ),
                  leading: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/822/822092.png"),),
                  title: Text(
                    kode,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal : " + tanggal.toDate().toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Nama Obat : " + obat,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Harga : " + price.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Jumlah : " + jumlah.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Total : " + total.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorPalette.hintColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}