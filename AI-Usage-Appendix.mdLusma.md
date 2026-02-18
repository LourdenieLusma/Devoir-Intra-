# Apendiks pou Diskloz Itilizasyon AI

**Non Etidyan an** _Lusma Lourdenie_______________________________  
**Tit Pwojè a:** ________Movie Finder________________________  
**Dat:** _________________16 Fevrier 2026_______________  

---

## Enstriksyon
**Konplete apendiks sa si w itilize zouti Entèlijans Ayifisyèl nan pwojè ou a. Li te mèt te kòd, rechèch ki gen asistans AI, chatbot, oubyen nenpòt lòt zouti AI, ou dwe soumèt pwojè ou a ak dokiman sa.**

**Si w pat itilize zouti AI, Tcheke sa** 

☐ *Pa gen zouti AI ki te itilize pou travay sa*

---

## Istorik Itilizasyon Zouti AI

**Konplete yon seksyon pou chak zouti AI/Sesyon ou itilize:**

### Zouti AI #1

**Non/Platfòm Zouti a:** _chat  GPT , youtube, recherche google_______________________________  
*(ekz., ChatGPT, Grammarly, GitHub Copilot, Rechèch Google, elatriyeee.)*

**Dat & Lè Itilizasyon an:** __________duran tout moman pwoje a ______________________

**Objektif Itilizasyon an:** _____________gen kek methode mwen pat konnen poum te arive fe pwoje sa paske li te ale au dela de sa nou we nan cours la , epi mwen pa two bon nan front end mwen te fe kek recherche sou koman pou jere design lan , nou te rankontre pwoble sou zafe APi la ae gras ak Chat la nou arive jere sa___________________  
*(Ekz., Deboge kòd, Asistans rechèch, elatriyee.)*

**_Prompt_ oubyen Rekèt ki te fèt la**
```
[Kopye/Kole ekzakteman tèks ou te tape nan zouti AI a]

gwoup mwen an chwazi pou nou fe movies (nou bal yon nom ki se movie finder )

nou gentan fe repartition taches yo konsa 

An n divize pwojè a an twa (3) gwo pati pou chak manb gwoup la ka travay san pwoblèm. Men pwopozisyon mwen pou w evite konfli nan kòd:

Manb 1 - Kò (Foundation & Navigation)

Responsabilite:

Kreye estrikti pwojè a (dosye, fichye)
Navigation ant ekran yo (BottomNavigationBar oswa Drawer)
Models (Movie klas ak fromJson/toJson)
Storage lokal (SharedPreferences pou senp favoris oswa paramèt)
Kreye widgets reutilizab (kad kart pou fim)
Fichye pral modifye:

lib/main.dart
lib/models/movie.dart
lib/services/storage_service.dart
lib/widgets/movie_card.dart
lib/screens/home_screen.dart (sèlman estrikti vid)

Manb 2 - API & Data

Responsabilite:

Koneksyon ak API TVmaze.com (fetch)
Jere JSON respons
Kreye servis API (MovieService)
Images depi network (affiche imaj)
Teste apèl API yo
Fichye pral modifye:

lib/services/api_service.dart
lib/models/movie.dart (si bezwen ajoute metòd)
lib/screens/home_screen.dart (ajiste pou afiche done)
lib/screens/details_screen.dart (estrikti baz)

Manb 3 - UI & State Management

Responsabilite:

Kreye tout UI ekran (Home, Details, Favoris)
State management ak setState
Jere favoris (ajoute/retire)
Entegre images (network ak assets)
Asire UI fonksyonèl ak responsiv
Fichye pral modifye:

lib/screens/home_screen.dart (UI konplè)
lib/screens/details_screen.dart (UI konplè)
lib/screens/favorites_screen.dart
lib/widgets/movie_card.dart (ajiste UI)
lib/main.dart (si bezwen ajoute route)

se mwen kap gen pou jere denye pati a eske wap ka ekplikem en gros et en details tout sa mwen dwe konprann poum ka arive fel



2zyem pati kesyon 

kounya nan Login nan mwen vle chanje koule kote ki ekri email la ak password la  ni kote pou moun nan klike poul konekte ak kreye 


```

**Tout repons/output zouti AI a te bay la:**
```
[Kopye/Kole ekzakteman repons (san modifikasyon) ou jwenn nan men zouti AI a]

🔥🔥 Movie Finder ap sonnen pwofesyonèl wi! Mwen fyè de jan nou òganize sa.

Ou menm ou gen pati ki pi enpòtan an:
👉 **UI + State Management + Favoris + Integration final**

Pou w reyisi pati pa w la, ou dwe metrize 4 bagay kle: setState, lis dinamik (ListView), navigation ak paramèt, epi jere favoris avèk SharedPreferences.

M ap eksplike w **an gros + an detay** pou w vrèman konprann.

---

# 🧠 1️⃣ KISA STATE MANAGEMENT YE (AVÈK setState)

Nan Flutter, lè done chanje → UI dwe rafrechi.

Egzanp:

* Itilizatè klike sou ❤️
* Lis favorit yo chanje
* UI dwe montre nouvo eta a

Sa fèt ak:

```dart
setState(() {
  isFavorite = true;
});
```

⚠️ Si w pa mete l nan `setState`, ekran an pap chanje menm si valè a chanje.

---

# 📱 2️⃣ HOME SCREEN – SA W DWE KONPRANN

HomeScreen ap:

* Resevwa lis movies soti nan API (manb 2)
* Afiche yo nan ListView
* Pèmèt klike sou yon movie → ale nan DetailsScreen

### Ou dwe konprann:

## 🔹 A) ListView.builder

```dart
ListView.builder(
  itemCount: movies.length,
  itemBuilder: (context, index) {
    return MovieCard(movie: movies[index]);
  },
);
```

Sa ap kreye lis dinamik selon kantite fim.

---

## 🔹 B) Navigation ak paramèt

Lè yo klike sou movie:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsScreen(movie: movie),
  ),
);
```

Sa voye movie a nan DetailsScreen.

---

# 🎬 3️⃣ DETAILS SCREEN – SA W DWE KONPRANN

DetailsScreen ap:

* Resevwa yon Movie
* Afiche:

  * Image.network
  * Title
  * Description
* Gen bouton ❤️ pou favorite

Egzanp constructor:

```dart
class DetailsScreen extends StatefulWidget {
  final Movie movie;

  DetailsScreen({required this.movie});
}
```

Ou itilize:

```dart
widget.movie.title
```

---

# ❤️ 4️⃣ FAVORIS – SA KI PI ENPÒTAN

Ou dwe:

✔ Ajoute movie nan favoris
✔ Retire li
✔ Sove nan SharedPreferences
✔ Rekipere li lè app lan relanse

---

## 🧠 Kijan SharedPreferences mache?

Li ka sèlman sove:

* String
* int
* bool
* List<String>

Movie se yon object.
Kidonk fòk nou konvèti li an JSON string.

---

### Egzanp Save Favorite

```dart
void saveFavorite(Movie movie) async {
  final prefs = await SharedPreferences.getInstance();

  List<String> favList = prefs.getStringList('favorites') ?? [];

  favList.add(jsonEncode(movie.toJson()));

  await prefs.setStringList('favorites', favList);
}
```

---

### Egzanp Load Favorites

```dart
void loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();

  List<String> favList = prefs.getStringList('favorites') ?? [];

  setState(() {
    favorites = favList
        .map((item) => Movie.fromJson(jsonDecode(item)))
        .toList();
  });
}
```

---

# 📂 5️⃣ FAVORITES SCREEN

Sa ap:

* Chaje lis favorit yo
* Afiche yo nan ListView
* Pèmèt retire yo

Menm prensip ak HomeScreen.

---

# 🖼 6️⃣ IMAGES NETWORK

TVMaze API bay image konsa:

```dart
Image.network(movie.imageUrl)
```

⚠️ Toujou verifye si image pa null:

```dart
movie.imageUrl != null
  ? Image.network(movie.imageUrl!)
  : Icon(Icons.movie);
```

---

# 🏗 7️⃣ STRUCTURE MANTAL OU DWE GENYEN

Panse app lan konsa:

```
API → Movie Model → UI → User Action → setState → Storage → Reload
```

---

# 🎯 8️⃣ ERÈ KI PI SOUVAN FÈ ETIDYAN RATE

❌ Bliye mete setState
❌ Pa verifye null
❌ Pa jere async/await
❌ Navigation san paramèt
❌ Doub ajoute menm favorite

---

# 🧩 9️⃣ SA W DWE METRIZE AVAN OU KÒMANSE

Asire w konprann:

* StatefulWidget vs StatelessWidget
* setState
* ListView.builder
* Navigator.push
* SharedPreferences
* JSON encode/decode

Si youn ladan yo pa klè, di m kounye a.

---

# 💎 10️⃣ KONSÈY PRO POU W FÈ BON ENPRESYON

Ajoute ti bagay sa yo:

✔ CircularProgressIndicator pandan API chaje
✔ SnackBar lè yo ajoute favorite
✔ Icon ki chanje koulè si se favorite
✔ Responsive padding
✔ Hero animation pou image (si w santi w alèz)

---

# 🏆 Si ou fè pati sa byen:

Pwojè a ap:

* Konplè
* Pwofesyonèl
* Fonksyonèl
* Respekte tout kondisyon

---

Kounye a di m:

👉 Eske ou vle mwen:

* Fè yon plan konkrè pou chak ekran?
* Oswa ba ou estrikti konplè pou UI + Favorites?
* Oswa eksplike SharedPreferences plis an detay?

Nou pral fè Movie Finder tounen pi bon pwojè nan klas la 😌🎬



dezyem pati repons

Bon 👌 nou pral chanje koulè:

* 📧 **Email**
* 🔒 **Password**
* 🔘 Bouton **Login**
* 🔘 Bouton **Create Account**

M ap ba w egzanp ki mache dirèk nan `LoginPage.dart`.

---

# 🎨 1️⃣ Chanje koulè Email & Password (TextField)

Si ou gen sa:

```dart
TextField(
  decoration: InputDecoration(
    labelText: "Email",
  ),
),
```

Chanje li konsa 👇

```dart
TextField(
  style: const TextStyle(color: Colors.white), // koulè tèks la
  decoration: InputDecoration(
    labelText: "Email",
    labelStyle: const TextStyle(color: Colors.orange), // koulè label
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.orange),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
),
```

Fè menm bagay la pou **Password**.

---

# 🎨 2️⃣ Chanje koulè bouton Login

Si ou gen:

```dart
ElevatedButton(
  onPressed: () {},
  child: const Text("Login"),
),
```

Chanje li konsa:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red, // koulè bouton
    foregroundColor: Colors.white, // koulè tèks
    padding: const EdgeInsets.symmetric(vertical: 15),
  ),
  onPressed: () {},
  child: const Text(
    "Login",
    style: TextStyle(fontSize: 18),
  ),
),
```

---

# 🎨 3️⃣ Chanje koulè Create Account

Si se TextButton:

```dart
TextButton(
  onPressed: () {},
  child: const Text(
    "Create Account",
    style: TextStyle(
      color: Colors.orange,
      fontWeight: FontWeight.bold,
    ),
  ),
),
```

---

# 🔥 Si ou vle background paj la nwa

Nan Scaffold la mete:

```dart
Scaffold(
  backgroundColor: Colors.black,
```

---

# 🎯 Egzanp koulè ki bèl pou app fim 🎬

* Background: `Colors.black`
* Email/Password border: `Colors.orange`
* Login button: `Colors.red`
* Create account: `Colors.orangeAccent`

Sa bay style Netflix 😎

---




```

**Kòman w te itilize repons ou te jwenn nan:**  
*(Dekri etap pa etap sa w te fè ak kontni zouti AI sa te jenere a)*
```
[Ekzanp: "Mwen itilize kòd AI a ban mwen depi nan kòmansman, aprè mwen modifye non varyab yo pou li ka koresponn ak pwojè mwen an epi mwen teste li."]

mwen pat two konn koman poum te fe pwoje a men a koz de devwa precedent an mwen te gentan gen kek idee de ki fichiers poum kreye e koman map fe l apre chak sa mwen pa konprann mwen fe chat gpt eksplikem li epi mwen gade kek pati nan video cours yo ak kek sou youtube epi mwen fe kek kod poukom epi le li banm ere mwen kopye ere a mwen fe chat eksplikem ere a e koman mwen ka korije l epi mwen pran koreksyon li ban m nan 
mwen pa fe okenn kope kole cependant gen kek bagay se caht ki ban mwenl surtout sa mwen pat konnen yo 


```

**Kisa w aprann sou repons ou jwenn nan?**  
*(Kisa w aprann sou pwosès la? Kòman zouti AI sa ede w nan aprantisaj ak konpreyansyon w?)*
```
san manti , mwen konprann anpil bagay nan sa li eksplikem e banm yo tankou nan design nan lan sim te bezwen gon ekriti ke textstyle pat kapab banm m tp ka nik selman add dependence google_fonts nan pubsec.yaml la epi nan kote m vle met ekriti a pi bel la olye mwen mete textstyle = ... mw ap mete google. 
epi mwen konnen tou lem mete safe area li la pou evite kontnim montre two anle oubyen desann two ba 
anpil lot bagay 



```

## Kontribisyon Sou Travay Final La

**Pousantaj kontribisyon pa w antanke imen, sou travay final la:** __60_____%

------

### Zouti AI #2
_Rekopye menm seksyon anlè a, si gen lòt zouti_

---



---
<img width="203" height="104" alt="image" src="https://gist.github.com/user-attachments/assets/a979028b-66f8-4661-83fc-b22b41e0eb3b" />

## Rekonesans Entegrite Akadamik ESIH

Soumèt apendiks sa vle di ke mwen afime ke:
- [ ] Mwen bay verite epi diskloz tout zouti AI mwen itilize pou pwojè sa
- [ ] _Prompt_ ak rekèt mwen bay yo konplè epi ekzat
- [ ] Mwen konprann si mwen pa diskloz tout zouti AI yo, sa ka kontribiye ak dezonè plis echèk mwen nan matyè sa

**Siyati Etidyan** __________Lusma Lourdenie______________________  
**Dat:** _________16 fevrier 2026_______________________

---