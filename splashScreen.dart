import 'package:flutter/material.dart';
import 'LoginPage.dart';


//ekran logo a kp afiche 10 sec
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
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginEkran()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Stack (
          children:[

            SizedBox.expand (
                child: Image.network ( 
                  "https://static.vecteezy.com/system/resources/thumbnails/027/841/178/small_2x/indoor-stage-and-spotlights-3d-rendering-photo.jpg",
                   fit : BoxFit.cover,
               ),
            ),
      
       Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 80),
    child:
            Text(
              "MovieFinder",
              style: TextStyle(
                fontSize: 50, 
                fontWeight: FontWeight.w900,
                 color: Color.fromARGB(218, 223, 227, 248),
             letterSpacing: 8,
          shadows: [
        Shadow(
          blurRadius: 10,
          color: Colors.black,
          offset: Offset(3, 3),
        ),
      ],
                ),
            ),
  
        ),
      ),
      ],
    ),
),
    );
  }
}

class Paran2 extends StatefulWidget {
  const Paran2({super.key});

  @override
  State<Paran2> createState() => _ProgressIndicator();
}

class _ProgressIndicator extends State<Paran2>{
   @override
  void initState() {
    super.initState();
    //dire logo a dwe afiche pou l voye nn login ekran
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Paran1()),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
       child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Chargement',
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ]
            )
         )
         ),
       //  backgroundColor: Color.fromARGB(71, 33, 229, 243)
    );

  }


}