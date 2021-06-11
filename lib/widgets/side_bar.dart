import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projek_uas_apotek/kategori/list_kategori.dart';
import 'package:projek_uas_apotek/login/color.dart';
import 'package:projek_uas_apotek/login/fade_animation.dart';
import 'package:projek_uas_apotek/login/first_screen.dart';
import 'package:projek_uas_apotek/login/login_page.dart';
import 'package:projek_uas_apotek/login/sign_in.dart';
import 'package:projek_uas_apotek/obat/list_obat.dart';
import 'package:projek_uas_apotek/sell/list_penjualan.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                FadeAnimation(
                  1,
                  Text("Apotek Sehat ",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                FadeAnimation(
                    1.3,
                    Text("Hi " + name,
                        style: TextStyle(color: Colors.white, fontSize: 16))),
                SizedBox(
                  height: 10.0,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
            ),
          ),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/619/619153.png"),
              height: 30.0,
            ),
            title: Text('Dashboard'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FirstScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/2911/2911700.png"),
              height: 30.0,
            ),
            title: Text('Kategori'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ListKategori();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/822/822092.png"),
              height: 30.0,
            ),
            title: Text('Data Obat'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ListObat();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/4521/4521052.png"),
              height: 30.0,
            ),
            title: Text('Data Penjualan'),
            onTap: () {
              // Update the state of the app
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ListPenjualan();
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: ColorPalette.primaryColor,
            ),
          ),
          ListTile(
            leading: Image(
              image: NetworkImage(
                  "https://image.flaticon.com/icons/png/512/2457/2457327.png"),
              height: 30.0,
            ),
            title: Text('Sign Out'),
            onTap: () {
              // Update the state of the app
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName('/'));
            },
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: ColorPalette.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
