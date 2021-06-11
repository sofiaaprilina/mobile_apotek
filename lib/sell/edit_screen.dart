import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/login/color.dart';
import 'database.dart';
import 'edit_form.dart';

class EditScreen extends StatefulWidget {
  final String currentKode;
  final Timestamp currentTanggal;
  final String currentObat;
  final int currentPrice;
  final int currentJumlah;
  final int currentTotal;
  final String documentId;

  EditScreen({
    this.currentKode,
    this.currentTanggal,
    this.currentObat,
    this.currentPrice,
    this.currentJumlah,
    this.currentTotal,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _tanggalFocusNode = FocusNode();
  final FocusNode _obatFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _jumlahFocusNode = FocusNode();
  final FocusNode _totalFocusNode = FocusNode();

  bool _isDeleting = false;

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
          'Edit Data Obat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    ),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              kodeFocusNode: _kodeFocusNode,
              tanggalFocusNode: _tanggalFocusNode,
              obatFocusNode: _obatFocusNode,
              priceFocusNode: _priceFocusNode,
              jumlahFocusNode: _jumlahFocusNode,
              totalFocusNode: _totalFocusNode,
              currentKode: widget.currentKode,
              currentTanggal: widget.currentTanggal,
              currentObat: widget.currentObat,
              currentPrice: widget.currentPrice,
              currentJumlah: widget.currentJumlah,
              currentTotal: widget.currentTotal,
            ),
          ),
        ),
      ),
    );
  }
}