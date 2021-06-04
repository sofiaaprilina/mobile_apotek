import 'package:flutter/material.dart';
import '/login/color.dart';
import 'database.dart';
import 'edit_form.dart';

class EditScreen extends StatefulWidget {
  final String currentName;
  final String currentDescription;
  final String documentId;

  EditScreen({
    this.currentName,
    this.currentDescription,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

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
          backgroundColor: ColorPalette.primaryColor,
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
              nameFocusNode: _nameFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              currentName: widget.currentName,
              currentDescription: widget.currentDescription,
            ),
          ),
        ),
      ),
    );
  }
}
