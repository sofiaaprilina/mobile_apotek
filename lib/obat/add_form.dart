import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';
import '/login/color.dart';
import 'database.dart';
import '/utils/validator.dart';

import 'custom_form_field.dart';

class AddForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode nameFocusNode;
  final FocusNode jenisFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode stokFocusNode;

  const AddForm({
    this.kodeFocusNode,
    this.nameFocusNode,
    this.jenisFocusNode,
    this.hargaFocusNode,
    this.stokFocusNode,
  });

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  var selectedCurrency;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Container(
        child: Expanded(
          flex: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                    hint: Text("---Pilih Jenis Obat---", style: TextStyle(color: ColorPalette.hintColor),),
                                      value: selectedCurrency,
                                      isDense: true,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          selectedCurrency = newValue;
                                          _jenisController.text = selectedCurrency;
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
                      padding: EdgeInsets.all(8.0),
                      height: 70.0,
                      width: double.infinity,
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
                          widget.kodeFocusNode.unfocus();
                          widget.nameFocusNode.unfocus();
                          widget.jenisFocusNode.unfocus();
                          widget.hargaFocusNode.unfocus();
                          widget.stokFocusNode.unfocus();

                          if (_addItemFormKey.currentState.validate()) {
                            setState(() {
                              _isProcessing = true;
                            });

                            await DatabaseO.addItem(
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
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Tambah Obat',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.primaryColor,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
