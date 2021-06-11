import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/widgets/side_bar.dart';
import '/login/color.dart';
import 'tambah_obat.dart';
import 'item_obat.dart';

class ListObat extends StatefulWidget {
  @override
  _ListObatState createState() => _ListObatState();
}

class _ListObatState extends State<ListObat> {
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
          image: NetworkImage("https://image.flaticon.com/icons/png/512/822/822092.png"),
          width: 25.0,
        ),
        SizedBox(width: 8),
        Text(
          'Data Obat',
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
              builder: (context) => TambahObat(),
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
          child: ItemObat(),
        ),
      ),
    );
  }
}
