import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'color.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign Up with Email'),
      // ),
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage("https://image.flaticon.com/icons/png/512/3789/3789046.png"),
                    width: 150.0,
                    height: 150.0,
                  ),
                  Column(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 16.0),),
                    Text(
                      "Registrasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 12.0),),
                    Text(
                      "Silahkan registrasi terlebih dahulu jika belum memiliki akun",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 12.0),),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.underlineTextField,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            hintText: "Email",
                            hintStyle:
                              TextStyle(color: ColorPalette.hintColor),
                          ),
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                        ),
                        Padding( padding: EdgeInsets.only(top: 12.0),),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.underlineTextField,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle:
                              TextStyle(color: ColorPalette.hintColor),
                          ),
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          autofocus: false,
                        ),
                        Padding(padding: EdgeInsets.only(top: 16.0),),
                        FlatButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            width: double.infinity,
                            child:Text(
                              'Register',
                              style: TextStyle(color: ColorPalette.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                              color: ColorPalette.hintColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            signUpWithEmail(
                              _emailController.text,
                              _passwordController.text)
                            .then((result) {
                              if (result != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                );
                              };
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(thickness: 1,color: Colors.white,),
                      ),
                      SizedBox(width: 20),
                      Text('OR',style: TextStyle(color: Colors.white),),
                      SizedBox(width: 20),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.white,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Already have account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
