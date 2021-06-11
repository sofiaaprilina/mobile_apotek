import 'package:flutter/material.dart';
import '/login/color.dart';
import 'tambah_penjualan.dart';
import 'itemPenjualan.dart';

class ListPenjualan extends StatefulWidget {
  @override
  _ListPenjualanState createState() => _ListPenjualanState();
}

class _ListPenjualanState extends State<ListPenjualan> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryDarkColor,
        title:Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: NetworkImage("https://image.flaticon.com/icons/png/512/822/822092.png"),
          width: 25.0,
        ),
        SizedBox(width: 8),
        Text(
          'Data Penjualan',
          style: TextStyle(
            color: ColorPalette.hintColor,
            fontSize: 18,
          ),
        ),
      ],
    ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TambahPenjualan(),
            ),
          );
        },
        backgroundColor: ColorPalette.hintColor,
        child: Icon(
          Icons.add,
          color: ColorPalette.primaryDarkColor,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemPenjualan(),
        ),
      ),
    );
  }
}
