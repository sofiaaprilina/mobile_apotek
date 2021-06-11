import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/widgets/side_bar.dart';
import '/login/color.dart';
import 'tambah_kategori.dart';
import 'item_kategori.dart';

class ListKategori extends StatefulWidget {
  @override
  _ListKategoriState createState() => _ListKategoriState();
}

class _ListKategoriState extends State<ListKategori> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: ColorPalette.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryDarkColor,
        title:Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: NetworkImage("https://image.flaticon.com/icons/png/512/2911/2911700.png"),
          width: 25.0,
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TambahKategori(),
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
          child: ItemKategori(),
        ),
      ),
    );
  }
}
