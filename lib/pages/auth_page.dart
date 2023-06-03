import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:good_news/pages/bottombar.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const routeName = '/login';
  Duration get loginTime => Duration(milliseconds: 2250);

   Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<User>(context, listen: false)
          .login(data.name, data.password);
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    // debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    // return Future.delayed(loginTime).then((_) {
    //   return null;
    // });
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async{
      try{
      await Provider.of<User>(context, listen: false)
        .signup(data.name.toString(), data.password.toString());
      }catch (err){
        print(err);
        return err.toString();
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'null';
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      
      // title: 'ECORP',
      logo: AssetImage('assets/images/logo_good_news.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomBar(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Color.fromARGB(255, 17, 156, 89),
        pageColorLight: Colors.white,
        // accentColor: Colors.yellow,
        // errorColor: Colors.deepOrange,
        // titleStyle: TextStyle(
        //   color: Colors.greenAccent,
        //   fontFamily: 'Quicksand',
        //   letterSpacing: 4,
        // ),
        bodyStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          // decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          decorationColor: Color.fromARGB(255, 17, 156, 89),
          color: Colors.black,
          // shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
        // buttonStyle: TextStyle(
        //   fontWeight: FontWeight.w800,
        //   color: Colors.yellow,
        // ),
        // cardTheme: CardTheme(
        //   color: Color.fromARGB(255, 199, 211, 205),
        //   elevation: 5,
        //   margin: EdgeInsets.only(top: 15),
        //   shape: ContinuousRectangleBorder(
        //       borderRadius: BorderRadius.circular(100.0)),
        // ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            // backgroundColor: Colors.orange,
            color: Colors.red,
          ),
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 17, 156, 89), width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 17, 156, 89), width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          // splashColor: Colors.purple,
          backgroundColor: Color.fromARGB(255, 17, 156, 89),
          // highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
        ),
      ),
    );
  }
}