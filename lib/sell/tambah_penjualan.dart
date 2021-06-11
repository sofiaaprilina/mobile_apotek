import 'package:flutter/material.dart';
import '/login/color.dart';
import 'add_form.dart';

class TambahPenjualan extends StatelessWidget {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _tanggalFocusNode = FocusNode();
  final FocusNode _obatFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _jumlahFocusNode = FocusNode();
  final FocusNode _totalFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _tanggalFocusNode.unfocus();
        _obatFocusNode.unfocus();
        _priceFocusNode.unfocus();
        _jumlahFocusNode.unfocus();
        _totalFocusNode.unfocus();
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
          'Tambah Penjualan',
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
              tanggalFocusNode: _tanggalFocusNode,
              obatFocusNode: _obatFocusNode,
              priceFocusNode: _priceFocusNode,
              jumlahFocusNode: _jumlahFocusNode,
              totalFocusNode: _totalFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}