import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var dataObjects = [
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  // Adicione mais objetos aqui
];

class _MyAppState extends State<MyApp> {
  MaterialColor selectedColor = Colors.deepPurple;

  void changeThemeColor(Color color) {
    setState(() {
      selectedColor = color as MaterialColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: selectedColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Cor 1'),
                    value: Colors.blue,
                  ),
                  PopupMenuItem(
                    child: Text('Cor 2'),
                    value: Colors.green,
                  ),
                  PopupMenuItem(
                    child: Text('Cor 3'),
                    value: Colors.orange,
                  ),
                ];
              },
              onSelected: (value) {
                changeThemeColor(value as Color);
              },
            ),
          ],
        ),
        body: DataBodyWidget(
          objects: dataObjects,
          headers: ["Nome", "Estilo", "IBU"],
          keys: ["name", "style", "ibu"],
        ),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),
      ],
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List objects;
  final List<String> headers;
  final List<String> keys;

  DataBodyWidget({
    required this.objects,
    required this.headers,
    required this.keys,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: headers.map(
          (header) {
            return DataColumn(
              label: Expanded(
                child: Text(
                  header,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            );
          },
        ).toList(),
        rows: objects.map(
          (obj) {
            return DataRow(
              cells: keys.map(
                (key) {
                  return DataCell(
                    Text(obj.containsKey(key) ? obj[key].toString() : ''),
                  );
                },
              ).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}
