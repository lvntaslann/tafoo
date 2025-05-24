import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/pages/mobil/Auth/Pages/login_page.dart';
import 'package:tafoo/services/auth_provider.dart';
import 'package:tafoo/Widgets/Mobil/auth/login_logo_container.dart';
import 'package:tafoo/Widgets/Mobil/button/auth_button.dart';
import 'package:tafoo/Widgets/Mobil/textfield/textfield_for_login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name =TextEditingController();
  TextEditingController surname =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

  void onTap() async {
    String nameValue = name.text;
    String surnameValue = surname.text;
    String emailValue = email.text;
    String passwordValue = password.text;

    final authProvider = Provider.of<CreateAccountProvider>(context, listen: false);
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
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
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
      backgroundColor: Color(0XFFD9D9D9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //tanıtım containerı
                    LoginLogoContainer(size: size,title1: " \' nun teknolojilerine\n   bir adım uzaksınız!",title2: "Kayıt Ol",isSignUp: true,),
                    SizedBox(height: 50),
                    //textfield
                    TextFieldForAuth(text: "İsim",controller: name, isPassword: false,),
                    SizedBox(height: 30),
                    TextFieldForAuth(text: "Soyisim",controller: surname, isPassword: false,),
                    SizedBox(height: 30),
                    TextFieldForAuth(text: "E-posta",controller: email, isPassword: false,),
                    SizedBox(height: 30),
                    TextFieldForAuth(text: "Şifre",controller: password, isPassword: true,),
                    SizedBox(height: 50),
                    //giriş yap butonu
                    AuthButton(size: size, onTap: onTap,text: "Kayıt ol",),
                    SizedBox(height: 20),
                    //hesabınız yok mu yazısı
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}