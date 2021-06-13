import 'package:flutter/material.dart';
import '/login/color.dart';
import 'add_form.dart';

class TambahKategori extends StatelessWidget {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _nameFocusNode.unfocus();
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
                  "https://image.flaticon.com/icons/png/512/2911/2911700.png"),
              width: 25.0,
            ),
        SizedBox(width: 8),
        Text(
          'Tambah Kategori',
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
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddForm(
              kodeFocusNode: _kodeFocusNode,
              nameFocusNode: _nameFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}