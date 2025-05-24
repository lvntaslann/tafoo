import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/auth_provider.dart';
import 'package:tafoo/Web/WebPages/Auth/web_login_page.dart';
import 'package:tafoo/Widgets/Web/Auth/textfield_for_webauth.dart';
import 'package:tafoo/Widgets/Web/Auth/web_auth_button.dart';

class WebSignupPage extends StatefulWidget {
  const WebSignupPage({Key? key}) : super(key: key);

  @override
  _WebSignupPageState createState() => _WebSignupPageState();
}

class _WebSignupPageState extends State<WebSignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void onTap() async {
    String nameValue = name.text;
    String surnameValue = surname.text;
    String emailValue = email.text;
    String passwordValue = password.text;

    final authProvider =
        Provider.of<CreateAccountProvider>(context, listen: false);
    User? user = await authProvider.signUpWithEmail(
      name: nameValue,
      surname: surnameValue,
      email: emailValue,
      password: passwordValue,
    );

    if (user != null) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 2), // 1 saniye animasyon süresi
          pageBuilder: (context, animation, secondaryAnimation) =>
              WebLoginPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt işlemi başarısız!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFE7F21),
      body: SingleChildScrollView(
        child: Row(
          children: [
            //logo and text
            Image.asset(
              "assets/images/tafoologo.png",
              width: 300,
              height: 400,
            ),
            Text(
              "ZAMAN KAYBETME\nHEMEN HESAP OLUŞTUR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),

            //login container
            SizedBox(width: 225),
            Container(
              margin: EdgeInsets.only(top: 100),
              height: size.height * 0.7,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 20),
                    child: Text(
                      "Kayıt ol",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextfieldForWebAuth(
                    text: 'Ad',
                    controller: name,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),
                  TextfieldForWebAuth(
                    text: 'Soyad',
                    controller: surname,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),
                  TextfieldForWebAuth(
                    text: 'E-mail',
                    controller: email,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),
                  TextfieldForWebAuth(
                    text: 'Şifre',
                    controller: password,
                    isPassword: true,
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: WebAuthButton(
                      size: size,
                      onTap: onTap,
                    ),
                  ),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.only(left: 350),
                    child: Hero(
                      tag: "tag",
                      child: Image.asset(
                        "assets/images/motorcycle.png",
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
