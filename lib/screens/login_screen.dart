import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';
import 'package:whatsapp_clone/utils/utilities.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameTextEditingController =
        TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgroundUI(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: FocusNode(),
                          controller: usernameTextEditingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Login",
                            labelStyle:
                                Utilities.xlgTextStyle(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          controller: passwordTextEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                Utilities.xlgTextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff907E00),
                                const Color(0xff2A75BC),
                              ],
                            ),
                          ),
                          child: FlatButton(
                            child: Text(
                              "Submit",
                              style: Utilities.mdTextStyle(
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget backgroundUI() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://static-cse.canva.com/blob/142366/10-expert-tips-for-designing-with-a-blurred-background-featured-image.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          color: Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }
}
