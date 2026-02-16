import 'package:flutter/material.dart';
import 'api_service.dart'; 
import 'models.dart';
import 'pageRecherche.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _navpage = 0;
  List<Movie> allMovies = [];
  List<Movie> trendingMovies = []; // Pour "Tendances"
  List<Movie> popularMovies = []; // Pour "Populaires"

  // Récupérer tous les films depuis l'API
  void getAllMovies() async {
    dynamic listMovs = await APIService.get('https://api.tvmaze.com/shows');
    setState(() {
      allMovies = listMovs.map<Movie>((mv) => Movie.fromJson(mv)).toList();
      trendingMovies = allMovies.take(10).toList(); // Exemple: top 10 pour Tendances
      popularMovies = allMovies.skip(10).take(20).toList(); // Top 20 pour Populaires
    });
  }

  @override
  void initState() {
    super.initState();
    getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _navpage == 2
          ? const Recherche()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Tendances horizontale
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tendances',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Voir tout',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) {
                        final mov = trendingMovies[index];
                        return Container(
                          width: 120,
                          margin: EdgeInsets.only(
                              left: 16, right: index == trendingMovies.length - 1 ? 16 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[800],
                                  image: mov.image != null
                                      ? DecorationImage(
                                          image: NetworkImage(mov.image!),
                                          fit: BoxFit.cover)
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                mov.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Section Populaires (verticale)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Populaires',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Voir tout',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Liste verticale des films populaires
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: popularMovies.length,
                    itemBuilder: (context, index) {
                      final mov = popularMovies[index];
                      return ListTile(
                        leading: Container(
                          width: 100,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[800],
                            image: mov.image != null
                                ? DecorationImage(
                                    image: NetworkImage(mov.image!),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                        ),
                        title: Text(
                          mov.name,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          mov.summary != null
                              ? mov.summary!.replaceAll(RegExp(r'<[^>]*>'), '')
                              : 'Pas de résumé',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.more_vert, color: Colors.black),
                        onTap: () {},
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Tous les films (ton ancienne liste)
                  Column(
                    children: allMovies.map((mov) => MovieWidget(mov)).toList(),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: _BottomNav(_navpage, onTap: (idx) {
        setState(() {
          _navpage = idx;
        });
      }),
    );
  }
}

Widget MovieWidget(Movie mov) {
  return Column(
    children: [
      Text(mov.name),
      mov.image != null ? Image.network(mov.image!) : const SizedBox(),
      Text(mov.summary != null
          ? mov.summary!.replaceAll(RegExp(r'<[^>]*>'), '')
          : "Pas de résumé"),
    ],
  );
}

class _BottomNav extends StatelessWidget {
  final int i;
  final Function(int)? onTap;
  _BottomNav(this.i, {this.onTap});
  @override
  Widget build(BuildContext c) => BottomNavigationBar(
        currentIndex: i,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.red), label: 'Favoris'),
        ],
      );
}
