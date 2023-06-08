import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<IconData> icons = [
    Icons.coffee_outlined,
    Icons.local_drink_outlined,
    Icons.flag_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          title: const Text("Dicas"),
          actions: [
            PopupMenuButton<Color>(
              onSelected: (Color color) {
                // Lógica para mudar a cor do tema
                print("Cor selecionada: $color");
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<Color>(
                  value: Colors.red,
                  child: Text('Vermelho'),
                ),
                PopupMenuItem<Color>(
                  value: Colors.green,
                  child: Text('Verde'),
                ),
                PopupMenuItem<Color>(
                  value: Colors.blue,
                  child: Text('Azul'),
                ),
              ],
            ),
          ],
        ),
        body: DataBodyWidget(
          objects: [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu",
          ],
        ),
        bottomNavigationBar: NewNavBar(icons: icons),
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({Widget? title, List<Widget>? actions})
      : super(
          title: title,
          actions: actions,
        );
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    final items = icons
        .map(
          (icon) => BottomNavigationBarItem(
            icon: Icon(icon),
            label: "Item ${icons.indexOf(icon)}",
          ),
        )
        .toList();

    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: items,
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects
          .map(
            (obj) => Expanded(
              child: Center(child: Text(obj)),
            ),
          )
          .toList(),
    );
  }
}
