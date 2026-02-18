import 'package:flutter/material.dart';
import 'api_sevice.dart';
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
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];

  void getAllMovies() async {
    dynamic listMovs = await APIService.get('https://api.tvmaze.com/shows');
    setState(() {
      allMovies = listMovs.map<Movie>((mv) => Movie.fromJson(mv)).toList();
      trendingMovies = allMovies.take(10).toList();
      popularMovies = allMovies.skip(10).take(20).toList();
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
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 194, 5, 5),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: Color.fromARGB(255, 167, 3, 3),
        backgroundColor: Color.fromARGB(255, 3, 5, 10),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 8, 8),
              Color.fromARGB(255, 241, 31, 31),
              Color.fromARGB(255, 22, 21, 21),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _navpage == 2
            ? const Recherche()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tendances',
                            style: TextStyle(
                              color: Color.fromARGB(255, 236, 36, 36),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Voir tout',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 189, 151, 28),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingMovies.length,
                        itemBuilder: (context, index) {
                          final mov = trendingMovies[index];
                          return Container(
                            width: 120,
                            margin: EdgeInsets.only(
                                left: 16,
                                right: index == trendingMovies.length - 1
                                    ? 16
                                    : 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(2, 4),
                                      )
                                    ],
                                    color: Color.fromARGB(255, 14, 0, 0),
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
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 201, 165, 5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Populaires',
                            style: TextStyle(
                              color: Color.fromARGB(255, 236, 36, 36),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Voir tout',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 197, 169, 8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: popularMovies.length,
                      itemBuilder: (context, index) {
                        final mov = popularMovies[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 100,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 0, 1, 12),
                                image: mov.image != null
                                    ? DecorationImage(
                                        image: NetworkImage(mov.image!),
                                        fit: BoxFit.cover)
                                    : null,
                              ),
                            ),
                            title: Text(
                              mov.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              mov.summary!.replaceAll(RegExp(r'<[^>]*>'), ''),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: const Icon(Icons.more_vert),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children:
                          allMovies.map((mov) => MovieWidget(mov)).toList(),
                    ),
                  ],
                ),
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
      Text(
        mov.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      mov.image != null ? Image.network(mov.image!) : const SizedBox(),
      Text(
        mov.summary!.replaceAll(RegExp(r'<[^>]*>'), ''),
      ),
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
        backgroundColor: Color.fromARGB(255, 0, 2, 7),
        selectedItemColor: Color.fromARGB(255, 212, 157, 6),
        unselectedItemColor: Color.fromARGB(255, 212, 157, 6),
        elevation: 15,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoris'),
        ],
      );
}
