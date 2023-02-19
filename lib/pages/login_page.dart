import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/my_routes.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: depend_on_referenced_packages

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

// ignore: camel_case_types
class _loginpageState extends State<loginpage> {
  String name = "";
  bool changedbutton = false;
  final formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        changedbutton = true;
      });
      await Navigator.pushNamed(context, My_routes.homepage);
      setState(() {
        changedbutton = false;
      });
      await Future.delayed(Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/Login_page.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                    color: context.accentColor,
                    fontFamily: GoogleFonts.laila().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.accentColor),
                        ),
                        prefixIcon: Icon(CupertinoIcons.person,
                            color: context.accentColor),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.buttonColor, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Enter User_name ",
                        hintStyle: TextStyle(
                            color: context.accentColor,
                            fontSize: 20,
                            fontFamily: GoogleFonts.laila().fontFamily),
                        labelText: "User Name",
                        labelStyle: TextStyle(
                            color: context.accentColor,
                            fontSize: 20,
                            fontFamily: GoogleFonts.laila().fontFamily),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Invalid Username!";
                        }
                        return null;
                      },
                      onChanged: ((value) {
                        name = value;
                        setState(() {});
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.accentColor),
                        ),
                        prefixIcon: Icon(CupertinoIcons.lock_shield,
                            color: context.accentColor),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.buttonColor, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Enter Password ",
                        hintStyle: TextStyle(
                            color: context.accentColor,
                            fontSize: 20,
                            fontFamily: GoogleFonts.laila().fontFamily),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: context.accentColor,
                            fontSize: 20,
                            fontFamily: GoogleFonts.laila().fontFamily),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Invalid Password!";
                        } else if (value.length < 6) {
                          return "Password Should be At least 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(changedbutton ? 60 : 10),
                child: InkWell(
                  splashColor: Colors.blue,
                  onDoubleTap: () => movetohome(context),
                  child: Ink(
                    //duration: Duration(seconds: 2),
                    width: changedbutton ? 60 : 150,
                    height: 40,
                    //color: Colors.deepPurpleAccent,
                    // alignment: Alignment.center,
                    child: changedbutton
                        ? Icon(Icons.done)
                        : Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.laila().fontFamily),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
