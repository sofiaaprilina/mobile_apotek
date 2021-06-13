import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';

import '/login/color.dart';
import 'database.dart';
import '/utils/validator.dart';

import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode nameFocusNode;
  final FocusNode jenisFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode stokFocusNode;
  final String currentKode;
  final String currentName;
  final String currentJenis;
  final int currentHarga;
  final int currentStok;
  final String documentId;

  const EditItemForm({
    this.kodeFocusNode,
    this.nameFocusNode,
    this.jenisFocusNode,
    this.hargaFocusNode,
    this.stokFocusNode,
    this.currentKode,
    this.currentName,
    this.currentJenis,
    this.currentHarga,
    this.currentStok,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _kodeController;
  TextEditingController _nameController;
  TextEditingController _jenisController;
  TextEditingController _hargaController;
  TextEditingController _stokController;

  var selectedCurrency;

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode
    );
    
    _nameController = TextEditingController(
      text: widget.currentName,
    );

    _jenisController = TextEditingController(
      text: widget.currentJenis,
    );

    _hargaController = TextEditingController(
      text: widget.currentHarga.toString(),
    );

    _stokController = TextEditingController(
      text: widget.currentStok.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Kode Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _kodeController,
                  focusNode: widget.kodeFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'kode',
                  hint: 'Masukkan kode obat',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Nama Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'name',
                  hint: 'Masukkan nama obat',
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                Text(
                  'Jenis Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('apotek').doc(userUid).collection('kategori').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          const Text("Loading");
                        else {
                          var length = snapshot.data.docs.length;
                          DocumentSnapshot ds = snapshot.data.docs[length - 1];
                          var _queryCat = snapshot.data.docs;
                          return new Container(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: DropdownButton<String>(
                                    // hint: Text("---Pilih Jenis Obat---", style: TextStyle(color: ColorPalette.hintColor),),
                                      value: _jenisController.text,
                                      isDense: true,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _jenisController.text = newValue;
                                          print(selectedCurrency);
                                        });
                                      },
                                      items: snapshot.data.docs.map((DocumentSnapshot document) {
                                        return new DropdownMenuItem<String>(
                                          value: document['name'],
                                          child: new Container(
                                          height: 30.0,
                                          child: new Text( document['name'], style: TextStyle(fontSize: 16.0),),
                                        ));
                                      }).toList(),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }
                    }),
                SizedBox(height: 10.0),
                Text(
                  'Harga Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _hargaController,
                  focusNode: widget.hargaFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'harga',
                  hint: 'Masukkan harga obat',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Stok Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _stokController,
                  focusNode: widget.stokFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'stok',
                  hint: 'Masukkan stok (jumlah) obat',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorPalette.primaryColor,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorPalette.primaryColor,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.kodeFocusNode.unfocus();
                      widget.nameFocusNode.unfocus();
                      widget.jenisFocusNode.unfocus();
                      widget.hargaFocusNode.unfocus();
                      widget.stokFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseO.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
                          name: _nameController.text,
                          jenis: _jenisController.text,
                          harga: int.tryParse(_hargaController.text),
                          stok: int.tryParse(_stokController.text),
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}