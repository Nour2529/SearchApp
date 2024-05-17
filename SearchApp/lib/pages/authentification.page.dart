import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Authentication Page",
          style: TextStyle(
            color: Colors.white, // App bar text color
            fontSize: 24, // App bar text size
          ),
        ),
        backgroundColor: Color(0xFF3b5998),
        elevation: 0, // Removing shadow
        iconTheme: IconThemeData(color: Colors.white), // App bar icon color
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
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  // Adjusting text style
                  color: Colors.black, // Text color
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _onConnect(context);
                },
                child: Text("Login"),
                style: ButtonStyle(
                  // Customizing button style
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3b5998)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      color: Colors.black, // Button text color
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
                  Navigator.pushNamed(context, '/inscription');
                },
                child: Text(
                  "Pas de compte?? Sign Up",
                  style: TextStyle(
                    color: Colors.blue, // Text color
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onConnect(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? log = prefs.getString("login");
    String? psw = prefs.getString("password");
    if (log == txt_login.text && psw == txt_password.text) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home', arguments: log);
    }
  }
}
