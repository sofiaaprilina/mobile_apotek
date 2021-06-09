import 'package:flutter/material.dart';
import '/login/color.dart';
import 'add_form.dart';

class TambahObat extends StatelessWidget {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _nameFocusNode.unfocus();
        _jenisFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _stokFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorPalette.primaryDarkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalette.primaryColor,
          title: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/822/822092.png"),
              width: 25.0,
            ),
        SizedBox(width: 8),
        Text(
          'Tambah Obat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddForm(
              kodeFocusNode: _kodeFocusNode,
              nameFocusNode: _nameFocusNode,
              jenisFocusNode: _jenisFocusNode,
              hargaFocusNode: _hargaFocusNode,
              stokFocusNode: _stokFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}