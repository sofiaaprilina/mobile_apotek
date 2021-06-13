import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/login/color.dart';
import 'edit_kategori.dart';
import 'database.dart';

class ItemKategori extends StatelessWidget {
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
              String name = noteInfo['name'];

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
                        currentName: name,
                        documentId: docID,
                      ),
                    ),
                  ),
                  leading: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/914/914832.png"),),
                  title: Text(
                    kode,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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