import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:food_application/screens/home/home-screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.toString();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(hintText: "Password"),
              onChanged: (value) {
                setState(() {
                  _password = value.toString();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("SingUp"),
                  onPressed: () {
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                  }),
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("LogIn"),
                  onPressed: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    print(_email);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
            ],
          ),
          SizedBox(
            width: 360,
            child: RaisedButton(
              child: Row(
                children: [
                  Icon(
                    Icons.mail,
                    size: 30,
                  ),
                  Text(
                    "Sing Up with Email",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              textColor: Colors.white,
              color: Colors.red[400],
              padding: EdgeInsets.all(10),
              onPressed: () {
                SingUpWithMail();
              },
            ),
          ),
          SizedBox(
            width: 360,
            child: RaisedButton(
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    size: 30,
                  ),
                  Text(
                    "Sing Up with Facebook",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              textColor: Colors.white,
              color: Colors.blue,
              padding: EdgeInsets.all(10),
              onPressed: () {
                SingUpWithFacebook();
              },
            ),
          ),
          SizedBox(
            width: 360,
            child: RaisedButton(
              child: Row(
                children: [
                  Icon(
                    Icons.grading_outlined,
                    size: 30,
                  ),
                  Text(
                    "Sing Up with Google",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              textColor: Colors.white,
              color: Colors.black,
              padding: EdgeInsets.all(10),
              onPressed: () {
                SingUpWithGoogle();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> SingUpWithMail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text, password: passwordController.text);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Succes sing up"),
            );
          });
    } catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }
  // Future<void> SingUpWithFacebook() async
  // {
  //   try{
  //     var facebookLogin = new FacebookLogin();
  //     var result = await facebookLogin.logIn(['email']);

  //     if(result.status == FacebookLoginStatus.loggedIn){
  //       final AuthCredential credential = FacebookAuthProvider.();

  //     }
  //   }
  // }

  Future<Null> SingUpWithFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<Null> SingUpWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
        hostedDomain: "",
        clientId: "",
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googelAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googelAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("singed In " + user.displayName);

      return user;
    } catch (e) {
      print(e.message);
    }
  }
}
