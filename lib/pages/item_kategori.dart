import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/login/color.dart';

import 'edit_screen.dart';

class ItemKategori extends StatelessWidget {
  final String name;
  final String description;
  //// Pointer to Update Function
  final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  ItemKategori(this.name, this.description, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
        height: 80.0,
        width: double.maxFinite,
      child: Ink(
        decoration: BoxDecoration(
          color: ColorPalette.hintColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          child: RaisedButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context)=>EditScreen(),
                )
              );
            },
            child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/914/914832.png"),
              height: 50.0, width: 40.0,),
              SizedBox(width: 2.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ],
              ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    width: 60,
                    child: RaisedButton(
                        shape: CircleBorder(),
                        color: Colors.red[900],
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (onDelete != null) onDelete();
                          // onDelete();
                        }),
                  ),
                ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
