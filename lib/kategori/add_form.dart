import 'package:flutter/material.dart';
import '/login/color.dart';
import 'database.dart';
import '/utils/validator.dart';

import 'custom_form_field.dart';

class AddForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode kodeFocusNode;

  const AddForm({
    this.nameFocusNode,
    this.kodeFocusNode,
  });

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
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
                SizedBox(height: 24.0),
                Text(
                  'Kode Kategori',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _kodeController,
                  focusNode: widget.kodeFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Kode',
                  hint: 'Masukkan kode kategori',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Nama Kategori',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
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
                  hint: 'Masukkan nama kategori',
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

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          kode: _kodeController.text,
                          name: _nameController.text,
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
                        'Tambah Kategori',
                        style: TextStyle(
                          fontSize: 20,
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

