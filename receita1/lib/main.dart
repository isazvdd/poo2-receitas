import 'package:flutter/material.dart';

void main() {
  ThemeData theme = ThemeData(
    primarySwatch: Colors.teal,
    fontFamily: 'Rubik',
  );

  MaterialApp app = MaterialApp(
    theme: theme,
    home: Scaffold(
      appBar: AppBar(title: Text("Cervejas")),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text("Nome")),
              DataColumn(label: Text("Estilo")),
              DataColumn(label: Text("IBU")),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("La Fin Du Monde")),
                DataCell(Text("Bock")),
                DataCell(Text("65")),
              ]),
              DataRow(cells: [
                DataCell(Text("Sapporo Premium")),
                DataCell(Text("Sour Ale")),
                DataCell(Text("54")),
              ]),
              DataRow(cells: [
                DataCell(Text("Duvel")),
                DataCell(Text("Pilsner")),
                DataCell(Text("82")),
              ]),
              // Linhas adicionais
              DataRow(cells: [
                DataCell(Text("Guinness")),
                DataCell(Text("Stout")),
                DataCell(Text("45")),
              ]),
              DataRow(cells: [
                DataCell(Text("Heineken")),
                DataCell(Text("Lager")),
                DataCell(Text("28")),
              ]),
              DataRow(cells: [
                DataCell(Text("Corona")),
                DataCell(Text("Pale Lager")),
                DataCell(Text("18")),
              ]),
              // Adicione quantas linhas extras desejar...
            ],
          ),
        ),
      ),
    ),
  );

  runApp(app);
}
