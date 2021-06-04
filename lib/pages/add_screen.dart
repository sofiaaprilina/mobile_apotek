import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/login/color.dart';

import 'item_kategori.dart';
import 'kategori.dart';

class AddScreen extends StatelessWidget {
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
      body: Form(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Nama Kategori",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: "Deskripsi",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          ColorPalette.hintColor,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Kategori(),
                          ),
                        );
                        await _kategori.add({
                          "name": nameController.text,
                          "description": descriptionController.text,
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'Tambah Kategori',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryDarkColor,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
