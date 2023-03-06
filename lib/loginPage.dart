import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugas1_tpm/constanta/Images.dart';
import 'package:tugas1_tpm/constanta/colors.dart';
import 'package:tugas1_tpm/constanta/sizes.dart';
import 'package:tugas1_tpm/constanta/text.dart';
import 'landingPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Image(image: AssetImage(tWelcomeScreenImage), height: size.height * 0.2),
                Text(
                  tLoginTitle,
                  style: TextStyle(
                    fontSize: 40,
                    color: tPrimaryColor,
                  ),
                ),
                Text(
                  tLoginSubTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54
                  ),
                ),

                Form(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: tFormHeight + 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        TextFormField(
                          onChanged: (value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: tUsername,
                              hintText: tUsername,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              )
                          ),
                        ),
                        const SizedBox(height: tFormHeight),
                        TextFormField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: passToggle,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: tPassword,
                            hintText: tPassword,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(
                                  passToggle ? Icons.visibility : Icons.visibility_off
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: tFormHeight + 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: tPrimaryColor,
                              minimumSize: const Size(330, 50),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                              ),
                            ),
                            onPressed: () {
                              String text = "";
                              if (username == "iniuser" && password == "inipass") {
                                setState(() {
                                  text = "Login Sukses";
                                  isLoginSuccess = true;
                                });
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                      return LandingPage();
                                    }));
                              } else {
                                setState(() {
                                  text = "Login Gagal, Input Username/Password Salah!";
                                  isLoginSuccess = false;
                                });
                              }
                            },
                            child: Text(tLogin.toUpperCase()),
                          ),
                        ),
                      ],
                    ),
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