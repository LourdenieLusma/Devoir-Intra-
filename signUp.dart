import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'signupDesign.dart';



//ekran pou anrejistre (Sign up)
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signup() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      FakeDatabase.users[email] = password;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Compte cree")),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignupDesign(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                const SizedBox(height: 60,),
                const Text(
            "Inscrire",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 21, 109),
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 40),
          
              TextFormField(
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    labelText: "Email",
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 1, 3, 107),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 1, 3, 107),
        width: 2.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 22, 80, 240),
        width: 2,
      ),
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Remplis le champ email";
    }
    if (!RegExp(r'^[a-zA-Z0-9._%-]+@gmail\.com$').hasMatch(value)) {
      return "l'email doit etre de la forme @gmail.com";
    }
    return null;
  },
),


              const SizedBox(height: 20),

              TextFormField(
  controller: passwordController,
  obscureText: true,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    labelText: "Mot de Passe",
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 1, 3, 107),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 1, 3, 107),
        width: 2.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 22, 80, 240),
        width: 2,
      ),
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Remplis le champs Mot de Passe";
    }
    if (value.length < 8) {
      return "Mot de Passe: 8 caracteres";
    }
    return null;
  },
),


              const SizedBox(height: 20),

              TextFormField(
  controller: confirmPasswordController,
  obscureText: true,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    labelText: "Confirmez Mot de Passe",
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 1, 3, 107),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 1, 3, 107),
        width: 2.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 22, 80, 240),
        width: 2,
      ),
    ),
  ),
  validator: (value) {
    if (value != passwordController.text) {
      return "Mot de Passe incorrect";
    }
    return null;
  },
),


              const SizedBox(height: 20),

              ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 54, 190, 244),
    foregroundColor: const Color.fromARGB(255, 2, 9, 100),
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 80,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  onPressed: signup,
  child: const Text(
    "Inscrire",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
),

            ],
          ),
        ),
      );
  }
}