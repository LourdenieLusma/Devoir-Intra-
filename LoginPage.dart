import 'package:flutter/material.dart';
import 'signUp.dart';
import 'pageAccueil.dart';

/// loginEkran
class LoginEkran extends StatefulWidget {
  const LoginEkran({super.key});

  @override
  State<LoginEkran> createState() => _LoginEkranState();
}

// Fake Database
class FakeDatabase {
  static Map<String, String> users = {
    "bervelie@gmail.com": "12345678"
  };
}

class _LoginEkranState extends State<LoginEkran> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passField = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      String email = emailField.text.trim();
      String password = passField.text.trim();
// kondisyon pou verifye si se login itilizate a chwazi si mail ak pass li okay si yo nn lis nou an
      if (FakeDatabase.users.containsKey(email) &&
          FakeDatabase.users[email] == password) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MyHomePage(title: 'MovieFinder App')),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email oubyn password ou rantre a pa bon")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KONEKTE")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: emailField,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Chan sa obligatwa";
                  }
                  if (!RegExp(r'^[a-zA-Z0-9._%-]+@gmail\.com$').hasMatch(value)) {
                    return "Email ou pa bon retape l";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passField,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Chan sa obligatwa";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: login,
                child: const Text("Konekte"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPage()),
                  );
                },
                child: const Text("Anrejistre"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



