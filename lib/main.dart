import 'package:flutter/material.dart';

void main() {
  runApp(SkyrimPotionApp());
}

class SkyrimPotionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF2E7D32),
        scaffoldBackgroundColor: Color(0xFFE8F5E9),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B5E20),
          titleTextStyle: TextStyle(color: Colors.white, fontFamily: 'Cinzel', fontSize: 24),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.green[900], fontFamily: 'Cinzel'),
          bodyMedium: TextStyle(color: Colors.green[800], fontFamily: 'Cinzel'),
          titleLarge: TextStyle(color: Colors.green[700], fontFamily: 'Cinzel', fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PotionCategoryPage(),
    InventoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skyrim İksir Arayıcı'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B5E20),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'İksir Ara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Envanterim',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF6FCDF),
        unselectedItemColor: Colors.lightGreen.shade100,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PotionCategoryPage extends StatelessWidget {
  final Map<String, Map<String, List<String>>> potionCategories = {
    'Yenileme İksirleri': {
      'Sağlık Düzeltme': ['Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği'],
      'Efsun Düzeltme': ['Funda Kalbi', 'Cüce Yağı', 'Elf Kulağı'],
    },
    'Güçlendirme İksirleri': {
      'Kuvvet Düzeltme': ['Arı', 'Bal Peteği', 'Daedra Kalbi'],
      'Dayanıklılık Güçlendirme': ['Sarımsak', 'Funda Kalbi', 'İt Otu'],
    },
    'Tedavi ve Direnç İksirleri': {
      'Hastalığı Tedavi Etme': ['Vampir Tozu', 'Nirnotu'],
      'Ateşe Direnç': ['Mehtap Güvesi Kanadı', 'Bataklık Tomurcuğu'],
    },
    'Hasar İksirleri': {
      'Sağlık Hasarı': ['Daedra Kalbi', 'Elf Kulağı'],
      'Efsun Hasarı': ['Cüce Yağı', 'Arı'],
    },
    'Direnç Kırma İksirleri': {
      'Ateşe Zayıflık': ['Funda Kalbi', 'Bal Peteği'],
      'Ayaza Zayıflık': ['Nirnotu', 'Vampir Tozu'],
    },
    'Çeşitli Zehir ve İksirler': {
      'Görünmezlik': ['Vampir Tozu', 'Nirnotu', 'Mehtap Güvesi Kanadı'],
      'Felç': ['Funda Kalbi', 'İt Otu', 'Bataklık Tomurcuğu'],
    },
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: potionCategories.entries.map((category) {
        return Card(
          color: Colors.lightGreen.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 5,
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            title: Text(category.key, style: Theme.of(context).textTheme.titleLarge),
            children: category.value.entries.map((potion) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF6FCDF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade200, blurRadius: 3, offset: Offset(0, 2))
                  ],
                ),
                child: ListTile(
                  title: Text(potion.key, style: TextStyle(color: Colors.green[900], fontSize: 18)),
                  subtitle: Text('Malzemeler: ${potion.value.join(', ')}', style: TextStyle(color: Colors.green[700])),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<String> allIngredients = [
    'Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği', 'Funda Kalbi', 'Cüce Yağı',
    'Elf Kulağı', 'Arı', 'Bal Peteği', 'Vampir Tozu', 'Nirnotu',
    'Mehtap Güvesi Kanadı', 'İt Otu', 'Bataklık Tomurcuğu'
  ];

  final Map<String, List<String>> potions = {
    'Sağlık Düzeltme': ['Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği'],
    'Efsun Düzeltme': ['Funda Kalbi', 'Cüce Yağı', 'Elf Kulağı'],
    'Kuvvet Düzeltme': ['Arı', 'Bal Peteği', 'Daedra Kalbi'],
    'Görünmezlik': ['Vampir Tozu', 'Nirnotu', 'Mehtap Güvesi Kanadı'],
    'Felç': ['Funda Kalbi', 'İt Otu', 'Bataklık Tomurcuğu'],
  };

  List<String> inventory = [];

  List<MapEntry<String, List<String>>> findAvailablePotions() {
    List<MapEntry<String, List<String>>> available = [];

    for (var entry in potions.entries) {
      int matchCount = entry.value.where((ingredient) => inventory.contains(ingredient)).length;
      if (matchCount >= 2) {
        available.add(entry);
      }
    }

    return available;
  }

  @override
  Widget build(BuildContext context) {
    final availablePotions = findAvailablePotions();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownSearch(),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: inventory.map((ingredient) {
              return Chip(
                backgroundColor: Color(0xFFF6FCDF),
                label: Text(ingredient, style: TextStyle(color: Colors.green[900])),
                onDeleted: () {
                  setState(() {
                    inventory.remove(ingredient);
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: availablePotions.isEmpty
                ? Center(child: Text('Envanterindeki malzemelerle iksir yapılamıyor.', style: TextStyle(color: Colors.green[900])))
                : ListView.builder(
              itemCount: availablePotions.length,
              itemBuilder: (context, index) {
                final potion = availablePotions[index];
                final matchingIngredients =
                potion.value.where((i) => inventory.contains(i)).toList();
                return Card(
                  color: Color(0xFFF6FCDF),
                  elevation: 3,
                  child: ListTile(
                    title: Text(potion.key, style: TextStyle(color: Colors.green[900], fontSize: 18)),
                    subtitle: Text('Kullanılabilir Malzemeler: ${matchingIngredients.join(', ')}', style: TextStyle(color: Colors.green[900])),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownSearch extends StatefulWidget {
  @override
  _DropdownSearchState createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<DropdownSearch> {
  String? selectedIngredient;
  final List<String> allIngredients = [
    'Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği', 'Funda Kalbi', 'Cüce Yağı',
    'Elf Kulağı', 'Arı', 'Bal Peteği', 'Vampir Tozu', 'Nirnotu',
    'Mehtap Güvesi Kanadı', 'İt Otu', 'Bataklık Tomurcuğu'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedIngredient,
      isExpanded: true,
      items: allIngredients.map((ingredient) {
        return DropdownMenuItem(
          value: ingredient,
          child: Text(ingredient, style: TextStyle(color: Colors.green[900])),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedIngredient = value;
          if (value != null && !context.findAncestorStateOfType<_InventoryPageState>()!.inventory.contains(value)) {
            context.findAncestorStateOfType<_InventoryPageState>()!.setState(() {
              context.findAncestorStateOfType<_InventoryPageState>()!.inventory.add(value);
            });
          }
        });
      },
      decoration: InputDecoration(
        labelText: 'Malzeme Ekle',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xFFF2F6D0),
        labelStyle: TextStyle(color: Colors.green[900]),
      ),
    );
  }
}
