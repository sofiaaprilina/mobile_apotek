import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/obat/list_obat.dart';
import 'package:projek_uas_apotek/pages/kategori.dart';
import 'color.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'fade_animation.dart';
import '../kategori/list_kategori.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, 
            colors: [
              ColorPalette.primaryDarkColor,
              ColorPalette.primaryColor,
              ColorPalette.hintColor,
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      FadeAnimation(
                        1,
                        Text("Apotek Sehat ",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                      FadeAnimation(
                        1.3,
                        Text("Welcome Hi " + name,
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                    ],
                  ),
                  SizedBox(width:100.0),
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(115, 230, 161, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                            ]
                        ),
                        child: Text(
                          "Pilihan Menu",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 370.0,
                        child: new Container(
                          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            children: [
                              InkResponse(
                                child: Column(children: [
                                  Image(
                                    image: NetworkImage("https://image.flaticon.com/icons/png/512/2911/2911700.png"),
                                    width: 100.0,
                                  ),
                                  Text("Kategori")
                                ],),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ListKategori();
                                      },
                                    ),
                                  );
                                },
                              ),
                              InkResponse(
                                child: Column(children: [
                                  Image(
                                    image: NetworkImage("https://image.flaticon.com/icons/png/512/822/822092.png"),
                                    width: 100.0,
                                  ),
                                  Text("Obat")
                                ],),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ListObat();
                                      },
                                    ),
                                  );
                                },
                              ),
                              InkResponse(
                                child: Column(children: [
                                  Image(
                                    image: NetworkImage("https://image.flaticon.com/icons/png/512/4521/4521052.png"),
                                    width: 100.0,
                                  ),
                                  Text("Pemesanan")
                                ],),
                                onTap: (){},
                              ),
                              InkResponse(
                                child: Column(children: [
                                  Image(
                                    image: NetworkImage("https://image.flaticon.com/icons/png/512/2457/2457327.png"),
                                    width: 100.0,
                                  ),
                                  Text("Keluar")
                                ],),
                                onTap: (){
                                  signOutGoogle();
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                  }), ModalRoute.withName('/'));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
