import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/login/color.dart';

import 'item_kategori.dart';

class EditScreen extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode descriptionFocusNode;
  final String currentName;
  final String currentDescription;
  final String documentId;

  const EditScreen({
    this.nameFocusNode,
    this.descriptionFocusNode,
    this.currentName,
    this.currentDescription,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>{
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;
  CollectionReference _kategori =
      FirebaseFirestore.instance.collection('kategori');

  TextEditingController _nameController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: widget.currentName,
    );

    _descriptionController = TextEditingController(
      text: widget.currentDescription,
    );
    super.initState();
  }

  @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: "App",
     home: Text("App"),
   );
    // return Form(
    //   key: _editItemFormKey,
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(
    //           left: 8.0,
    //           right: 8.0,
    //           bottom: 24.0,
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 24.0),
    //             Text(
    //               'Name',
    //               style: TextStyle(
    //                 color: ColorPalette.hintColor,
    //                 fontSize: 22.0,
    //                 letterSpacing: 1,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(height: 8.0),

    //             TextField(
    //                           style: TextStyle(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 16),
    //                           controller: _nameController,
    //                           decoration: InputDecoration(
    //                               hintText: "Nama Kategori",
    //                               hintStyle: TextStyle(
    //                                   color: Colors.grey,
    //                                   fontWeight: FontWeight.w600,
    //                                   fontSize: 16)),
    //                         ),
    //             SizedBox(height: 24.0),
    //             Text(
    //               'Description',
    //               style: TextStyle(
    //                 color: ColorPalette.hintColor,
    //                 fontSize: 22.0,
    //                 letterSpacing: 1,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(height: 8.0),
    //             TextField(
    //                           style: TextStyle(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 16),
    //                           controller: _descriptionController,
    //                           decoration: InputDecoration(
    //                               hintText: "Deskkripsi",
    //                               hintStyle: TextStyle(
    //                                   color: Colors.grey,
    //                                   fontWeight: FontWeight.w600,
    //                                   fontSize: 16)),
    //                         ),
    //           ],
    //         ),
    //       ),
    //       _isProcessing
    //           ? Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: CircularProgressIndicator(
    //                 valueColor: AlwaysStoppedAnimation<Color>(
    //                   ColorPalette.primaryDarkColor,
    //                 ),
    //               ),
    //             )
    //           : Container(
    //               width: double.maxFinite,
    //               child: ElevatedButton(
    //                 style: ButtonStyle(
    //                   backgroundColor: MaterialStateProperty.all(
    //                     ColorPalette.hintColor,
    //                   ),
    //                   shape: MaterialStateProperty.all(
    //                     RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                   ),
    //                 ),
    //                 onPressed: () async {
    //                   widget.nameFocusNode.unfocus();
    //                   widget.descriptionFocusNode.unfocus();

    //                   if (_editItemFormKey.currentState.validate()) {
    //                     setState(() {
    //                       _isProcessing = true;
    //                     });

    //                      StreamBuilder<QuerySnapshot>(
    //                 // contoh penggunaan srteam
    //                 // _pengguna.orderBy('age', descending: true).snapshots()
    //                 // _pengguna.where('age', isLessThan: 30).snapshots()
    //                 stream:
    //                     _kategori.orderBy('name', descending: true).snapshots(),
    //                 builder: (buildContext, snapshot) {
    //                   return Column(
    //                     children: snapshot.data.docs
    //                         .map((e) => ItemKategori(
    //                               e.data()['name'],
    //                               e.data()['description'],
    //                               onUpdate: () {
    //                                 _kategori
    //                                     .doc(e.id)
    //                                     .update({
    //                                       "nama": _nameController,
    //                                       "description": _descriptionController,
    //                                     });
    //                               },
    //                               onDelete: () {
    //                                 _kategori.doc(e.id).delete();
    //                               },
    //                             ))
    //                         .toList(),
    //                   );
    //                 },
    //               );

    //                     setState(() {
    //                       _isProcessing = false;
    //                     });

    //                     Navigator.of(context).pop();
    //                   }
    //                 },
    //                 child: Padding(
    //                   padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
    //                   child: Text(
    //                     'UPDATE ITEM',
    //                     style: TextStyle(
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.bold,
    //                       color: ColorPalette.hintColor,
    //                       letterSpacing: 2,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //     ],
    //   ),
    // );
  }
}
  
