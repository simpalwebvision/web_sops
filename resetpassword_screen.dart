import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var _submit;
    return Scaffold(
      backgroundColor: Color.fromRGBO(212, 201, 238, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Reset your password',
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Center(
                  child: Text(
                    'Enter your registered login email address to receive a secure link to set a new password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 124, 124),
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var _loginUserData;
                      _loginUserData['email'] = value!;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Set Password",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 123, 113),
                        fontSize: 25),
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
