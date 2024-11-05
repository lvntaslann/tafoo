import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Auth/Pages/signup_page.dart';
import 'package:tafoo/Mobil/Auth/auth_provider.dart';
import 'package:tafoo/Mobil/Auth/google_sign_in_provider.dart';
import 'package:tafoo/Mobil/Pages/home_page.dart';
import 'package:tafoo/Widgets/Mobil/auth/dont_have_account.dart';
import 'package:tafoo/Widgets/Mobil/auth/login_logo_container.dart';
import 'package:tafoo/Widgets/Mobil/auth/login_with_google_widget.dart';
import 'package:tafoo/Widgets/Mobil/auth/or_divider_widget.dart';
import 'package:tafoo/Widgets/Mobil/button/auth_button.dart';
import 'package:tafoo/Widgets/Mobil/textfield/textfield_for_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

  void onTap() {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) => SignupPage(),
    ),
  );
}

 void onTapLogin() async {
    String emailValue = email.text;
    String passwordValue = password.text;

    final authProvider = Provider.of<CreateAccountProvider>(context, listen: false);
    User? user = await authProvider.signInWithEmail(emailValue, passwordValue);

    if (user != null) {
      // Başarılı giriş durumunda yapılacak işlemler
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş işlemi başarısız!')),
      );
    }
  }


  void onTapGoogleLogin() async{
    final googleSignIn =
        Provider.of<GoogleSignInProvider>(context, listen: false);
       await googleSignIn.signInWithGoogle(context);
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
                    LoginLogoContainer(size: size, title1: "\' nun özelliklerinden \n  yararlanmak istiyorsan",title2: "Hadi Başlayalım!",isSignUp: false,),
                    SizedBox(height: 50),
                    //textfield
                    TextFieldForAuth(text: "E-posta",controller: email, isPassword: false,),
                    SizedBox(height: 30),
                    TextFieldForAuth(text: "Şifre",controller: password, isPassword: true,),
                    SizedBox(height: 50),
                    //giriş yap butonu
                    AuthButton(size: size, onTap: onTapLogin,text: "Giriş Yap",),
                    SizedBox(height: 20),
                    //hesabınız yok mu yazısı
                    DontHaveAccount(onTap: onTap,),
                    SizedBox(height: 30),
                    //farklı giriş yöntemleri için divider widgeti
                    OrDividerWidget(),
                    SizedBox(height: 35),
                    LoginWithGoogleWidget(onTap: onTapGoogleLogin,)
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












