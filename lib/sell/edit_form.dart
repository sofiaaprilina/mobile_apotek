import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/login/color.dart';
import 'database.dart';
import '/utils/validator.dart';

import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode tanggalFocusNode;
  final FocusNode obatFocusNode;
  final FocusNode priceFocusNode;
  final FocusNode jumlahFocusNode;
  final FocusNode totalFocusNode;
  final String currentKode;
  final Timestamp currentTanggal;
  final String currentObat;
  final int currentPrice;
  final int currentJumlah;
  final int currentTotal;
  final String documentId;

  const EditItemForm({
    this.kodeFocusNode,
    this.tanggalFocusNode,
    this.obatFocusNode,
    this.priceFocusNode,
    this.jumlahFocusNode,
    this.totalFocusNode,
    this.currentKode,
    this.currentTanggal,
    this.currentObat,
    this.currentPrice,
    this.currentJumlah,
    this.currentTotal,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _kodeController;
  TextEditingController _tanggalController;
  TextEditingController _obatController;
  TextEditingController _priceController;
  TextEditingController _jumlahController;
  TextEditingController _totalController;

  DateTime _dateTime = DateTime.now();
  _selectedTodoDate(BuildContext context) async{
    var _pickedDate = await showDatePicker(
      context: context, 
      initialDate: _dateTime, 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    );
    if(_pickedDate != null){
      setState((){
        _dateTime = _pickedDate;
        _tanggalController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode
    );
    
    _tanggalController = TextEditingController(
      text: widget.currentTanggal.toDate().toString(),
    );

    _obatController = TextEditingController(
      text: widget.currentObat,
    );

    _priceController = TextEditingController(
      text: widget.currentPrice.toString(),
    );

    _jumlahController = TextEditingController(
      text: widget.currentJumlah.toString(),
    );

    _totalController = TextEditingController(
      text: widget.currentTotal.toString(),
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
                  'Kode Penjualan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
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
                  hint: 'Masukkan Kode Penjualan',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Tanggal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _tanggalController,
                  focusNode: widget.tanggalFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    hintText: '---Pilih Tanggal---',
                    prefixIcon: InkWell(
                      onTap: (){ _selectedTodoDate(context);},
                      child: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Nama Obat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _obatController,
                  focusNode: widget.obatFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'obat',
                  hint: 'Pilih obat',
                ),
                SizedBox(height: 10.0),
                Text(
                  'price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _priceController,
                  focusNode: widget.priceFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'price',
                  hint: 'Masukkan price obat',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Jumlah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _jumlahController,
                  focusNode: widget.jumlahFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'jumlah',
                  hint: 'Masukkan jumlah',
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
                      widget.tanggalFocusNode.unfocus();
                      widget.obatFocusNode.unfocus();
                      widget.priceFocusNode.unfocus();
                      widget.jumlahFocusNode.unfocus();
                      widget.totalFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
                          tanggal: Timestamp.fromDate(_dateTime),
                          obat: _obatController.text,
                          price: int.tryParse(_priceController.text),
                          jumlah: int.tryParse(_jumlahController.text),
                          total: int.tryParse(_priceController.text) * int.tryParse(_jumlahController.text),
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