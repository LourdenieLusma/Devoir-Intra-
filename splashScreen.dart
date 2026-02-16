import 'package:flutter/material.dart';
import 'LoginPage.dart';


//ekran logo a kp afiche 5 sec
class Paran1 extends StatefulWidget {
  const Paran1({super.key});

  @override
  State<Paran1> createState() => _Ekran1State();
}

class _Ekran1State extends State<Paran1> {

  @override
  void initState() {
    super.initState();
    //dire logo a dwe afiche pou l voye nn login ekran
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginEkran()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.lock, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "VERSALUX",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}