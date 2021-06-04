import 'package:flutter/material.dart';
import '/login/color.dart';
import 'add_form.dart';

class TambahKategori extends StatelessWidget {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalette.primaryDarkColor,
          title: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage("assets/firebase_logo.png"), height: 15.0),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddForm(
              nameFocusNode: _nameFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}