import 'package:flutter/material.dart';

void main() {
  runApp(SkyrimPotionApp());
}

class SkyrimPotionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.green[700],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.green[700],
        onTap: _onItemTapped,
      ),
    );
  }
}

class PotionCategoryPage extends StatelessWidget {
  final Map<String, Map<String, List<String>>> potionCategories = {
    'Yenileme İksirleri': {
      'Sağlık Düzeltme': ['Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği', 'Keskindiş Gözü', 'Kabarık Mantar', 'İblis Oturağı', 'Kaya Bülbülü Yumurtası', 'Bataklık Tomurcuğu', 'Közlenmiş Sıçan Derisi', 'Kelebek Kanadı', 'Mavi Yusufçuk', 'Kül Çıvanı Peltesi (Dragonborn)', 'Felsaad Kırlangıç Tüyleri (Dragonborn)', ],
      'Efsun Düzeltme': ['Funda Kalbi', 'Cüce Yağı', 'Elf Kulağı' 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', ],
      'Kuvvet Düzeltme': ['Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', ],
      'Sağlık Yenileme': ['Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', ],
      'Efsun Yenileme': ['Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', ],
      'Kuvvet Yenileme': ['Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', 'Cüce', ],
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
        return ExpansionTile(
          title: Text(category.key, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          children: category.value.entries.map((potion) {
            return ListTile(
              title: Text(potion.key),
              subtitle: Text('Malzemeler: ${potion.value.join(', ')}'),
            );
          }).toList(),
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
    'Sağlık Düzeltme': ['Daedra Kalbi', 'Buğday', 'Mavi Dağ Çiçeği', 'Keskindiş Gözü', 'Kabarık Mantar', 'İblis Oturağı', 'Kaya Bülbülü Yumurtası', 'Bataklık Tomurcuğu', 'Közlenmiş Sıçan Derisi', 'Kelebek Kanadı', 'Mavi Yusufçuk', 'Kül Çıvanı Peltesi (Dragonborn)', 'Felsaad Kırlangıç Tüyleri (Dragonborn)', ],
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
                label: Text(ingredient),
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
                ? Center(child: Text('Envanterindeki malzemelerle iksir yapılamıyor.'))
                : ListView.builder(
              itemCount: availablePotions.length,
              itemBuilder: (context, index) {
                final potion = availablePotions[index];
                final matchingIngredients =
                potion.value.where((i) => inventory.contains(i)).toList();
                return Card(
                  child: ListTile(
                    title: Text(potion.key),
                    subtitle: Text('Kullanılabilir Malzemeler: ${matchingIngredients.join(', ')}'),
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
          child: Text(ingredient),
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
      ),
    );
  }
}
