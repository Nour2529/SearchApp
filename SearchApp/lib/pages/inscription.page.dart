import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 24, // Font size
          ),
        ),
        backgroundColor: Color(0xFF3b5998),
        elevation: 0, // Removing shadow
        iconTheme: IconThemeData(color: Colors.white), // Icon color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person, color: Colors.grey), // Icon color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Text field background color
                ),
                style: TextStyle(
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: txt_password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey), // Icon color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Text field background color
                ),
                style: TextStyle(
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _onInscrire(context);
                },
                child: Text("Sign Up"),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3b5998)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 18, // Font size
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/authentification');
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: Color(0xFF3b5998),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home', arguments: txt_login.text);
    } else {
      final snackBar = SnackBar(
        content: Text('Please enter a valid username and password.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
