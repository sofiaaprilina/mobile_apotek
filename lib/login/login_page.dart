import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'register_page.dart';
import 'first_screen.dart';
import 'color.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage("https://image.flaticon.com/icons/png/512/3014/3014261.png"),
                    width: 150.0,
                    height: 150.0,
                  ),
                  _titleDescription(),
                  _emailSignIn(),
                  SizedBox(height: 5.0),
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
                  _signInButton(),
                  SizedBox(height: 150.0),
                  _emailRegister(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0)),
        SizedBox(width: 20),
        FlatButton(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              SizedBox(width: 20),
              Text(
                'Sign In with Google',
                style: TextStyle(color: ColorPalette.primaryColor),
              ),
            ],),
            decoration: BoxDecoration(
              color: ColorPalette.hintColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            signInWithGoogle().then((result) {
              if (result != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstScreen();
                    },
                  ),
                );
              }
            });
          },
        ),
      ],
    );
  }

  Widget _titleDescription() {
    return Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 16.0),),
      Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 12.0),),
      Text(
        "Silahkan login terlebih dahulu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }

  Widget _emailSignIn() {
    return Container(
      child: Form(
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
                hintStyle: TextStyle(color: ColorPalette.hintColor),
              ),
              style: TextStyle(color: Colors.white),
              autofocus: false,
            ),
            Padding(padding: EdgeInsets.only(top: 12.0),),
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
                hintStyle: TextStyle(color: ColorPalette.hintColor),
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
                  'Sign In',
                  style: TextStyle(color: ColorPalette.primaryColor),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: ColorPalette.hintColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                signInWithEmail(_emailController.text, _passwordController.text)
                    .then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstScreen();
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
    );
  }

  Widget _emailRegister() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Don\’t have account ?',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
