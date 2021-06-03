import 'package:flutter/material.dart';
import '/login/color.dart';

class ListKategori extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.hintColor,
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    color: ColorPalette.primaryDarkColor,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/1141/1141913.png")),
                      ),
                      title: Text("Obat Tetes Mata", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Card(
                    color: ColorPalette.primaryDarkColor,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/1141/1141913.png")),
                      ),
                      title: Text("Obat Tetes Telinga", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Card(
                    color: ColorPalette.primaryDarkColor,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/1141/1141913.png")),
                      ),
                      title: Text("Obat Batuk", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}