import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/login/color.dart';
import 'database.dart';
import '/utils/validator.dart';

import 'custom_form_field.dart';

class AddForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode tanggalFocusNode;
  final FocusNode obatFocusNode;
  final FocusNode priceFocusNode;
  final FocusNode jumlahFocusNode;
  final FocusNode totalFocusNode;

  const AddForm({
    this.kodeFocusNode,
    this.tanggalFocusNode,
    this.obatFocusNode,
    this.priceFocusNode,
    this.jumlahFocusNode,
    this.totalFocusNode,
  });

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

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

  var selectedCurrency, selectedType;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _obatController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Kode Penjualan',
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
                  hint: 'Masukkan kode penjualan',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Tanggal Penjualan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _tanggalController,
                //   focusNode: widget.tanggalFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   validator: (value) => Validator.validateField(
                //     value: value,
                //   ),
                //   label: 'tanggal',
                //   hint: '--Tanggal Penjualan--',
                // ),
                TextField(
                  controller: _tanggalController,
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
                    fontSize: 16.0,
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
                  'Harga',
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
                  controller: _priceController,
                  focusNode: widget.priceFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'price',
                  hint: 'Masukkan harga obat',
                ),
                SizedBox(height: 10.0),
                Text(
                  'Jumlah',
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
                  controller: _jumlahController,
                  focusNode: widget.jumlahFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Jumlah',
                  hint: 'Masukkan jumlah ',
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
                      widget.tanggalFocusNode.unfocus();
                      widget.obatFocusNode.unfocus();
                      widget.priceFocusNode.unfocus();
                      widget.jumlahFocusNode.unfocus();
                      widget.totalFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
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
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tambah Penjualan',
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
    );
  }
}

