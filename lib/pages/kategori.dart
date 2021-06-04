import 'add_screen.dart';
import 'item_kategori.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '/login/color.dart';

class Kategori extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  CollectionReference _kategori =
      FirebaseFirestore.instance.collection('category');

  void clearInputText() {
    nameController.text = "";
    descriptionController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/2911/2911700.png"),
              width: 25.0,
            ),
            SizedBox(width: 8),
            Text(
              'Kategori',
              style: TextStyle(
                color: ColorPalette.hintColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorPalette.primaryDarkColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: ColorPalette.hintColor,
        child: Icon(
          Icons.add,
          color: ColorPalette.primaryDarkColor,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ListView(
              children: [
                StreamBuilder<QuerySnapshot>(
                    // contoh penggunaan srteam
                    // _pengguna.orderBy('age', descending: true).snapshots()
                    // _pengguna.where('age', isLessThan: 30).snapshots()
                    stream:
                        _kategori.orderBy('name').snapshots(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => ItemKategori(
                                  e.data()['name'],
                                  e.data()['description'],
                                  onDelete: () {
                                    _kategori.doc(e.id).delete();
                                  },
                                ))
                            .toList(),
                      );
                    },
                  ),
                  
              ],
            ),
          ),
        ),
      );
  }
}
