import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContantPages extends StatelessWidget {
  const ContantPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset('assets/images/logo3.png'),
          )),
          Text(
            'Contant US',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: 'Last'),
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  onChanged: (value) {
                    pass = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email, password: pass);
                        Navigator.pushNamed(context, 'home');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Text('Submit')),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
