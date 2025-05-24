import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/auth_provider.dart';
import 'package:tafoo/Web/WebPages/Auth/web_signup_page.dart';
import 'package:tafoo/Web/WebPages/web_home_page.dart';
import 'package:tafoo/Widgets/Mobil/auth/login_with_google_widget.dart';
import 'package:tafoo/Widgets/Mobil/auth/or_divider_widget.dart';
import 'package:tafoo/Widgets/Web/Auth/textfield_for_webauth.dart';
import 'package:tafoo/Widgets/Web/Auth/web_auth_button.dart';

class WebLoginPage extends StatefulWidget {
  const WebLoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<WebLoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void onTap() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 2),
        pageBuilder: (context, animation, secondaryAnimation) =>
            WebSignupPage(),
      ),
    );
  }

  void onTapLogin() async {
    String emailValue = email.text;
    String passwordValue = password.text;

    final authProvider =
        Provider.of<CreateAccountProvider>(context, listen: false);
    User? user = await authProvider.signInWithEmail(emailValue, passwordValue);

    if (user != null) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (context, animation, secondaryAnimation) =>
              WebHomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş işlemi başarısız!')),
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
              "GÜVENİLİRN\nİLANLARIN ADRESİ!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),

            //login container
            SizedBox(width: 300),
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
                      "Giriş Yap",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        Text(
                          "Henüz hesabın yok mu?",
                          style: TextStyle(
                              color: Color(0XFF4B4B4B),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: onTap, child: Text("Kayıt ol")),
                      ],
                    ),
                  ),
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
                      onTap: onTapLogin,
                    ),
                  ),
                  SizedBox(height: 40),
                  OrDividerWidget(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 195),
                    child: LoginWithGoogleWidget(),
                  ),
                  Hero(
                    tag: "tag",
                    child: Image.asset(
                      "assets/images/motorcycle.png",
                      width: 90,
                      height: 90,
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
