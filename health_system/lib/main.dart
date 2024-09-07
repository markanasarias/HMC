// import 'package:flutter/material.dart';
// import 'package:health_system/presentation/app.dart';
// import 'package:flutter/cupertino.dart';

// void main() async {
//   runApp(const App());
// }

import 'dart:convert';

import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:health_system/data_model.dart';
import 'dart:convert';
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:health_system/presentation/app.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.light(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> userList = [];

  late List<ExpandableColumn<dynamic>> headers;
  late List<ExpandableRow> rows;

  bool _isLoading = true;

  void setLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    userList = [
      Users(
          id: 1,
          firstName: 'John',
          lastName: 'Doe',
          maidenName: '',
          age: 30,
          gender: 'Male',
          email: 'john.doe@example.com'),
      Users(
          id: 2,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 3,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 4,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 5,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 6,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 7,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 8,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 9,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
      Users(
          id: 10,
          firstName: 'Jane',
          lastName: 'Smith',
          maidenName: 'Doe',
          age: 25,
          gender: 'Female',
          email: 'jane.smith@example.com'),
    ];

    createDataSource();
    setLoading();
  }

  void createDataSource() {
    headers = [
      ExpandableColumn<int>(columnTitle: "ID", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "First name", columnFlex: 2),
      ExpandableColumn<String>(columnTitle: "Last name", columnFlex: 2),
      ExpandableColumn<String>(columnTitle: "Maiden name", columnFlex: 2),
      ExpandableColumn<int>(columnTitle: "Age", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "Gender", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "Email", columnFlex: 4),
    ];

    rows = userList.map<ExpandableRow>((e) {
      return ExpandableRow(cells: [
        ExpandableCell<int>(columnTitle: "ID", value: e.id),
        ExpandableCell<String>(columnTitle: "First name", value: e.firstName),
        ExpandableCell<String>(columnTitle: "Last name", value: e.lastName),
        ExpandableCell<String>(columnTitle: "Maiden name", value: e.maidenName),
        ExpandableCell<int>(columnTitle: "Age", value: e.age),
        ExpandableCell<String>(columnTitle: "Gender", value: e.gender),
        ExpandableCell<String>(columnTitle: "Email", value: e.email),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !_isLoading
            ? LayoutBuilder(builder: (context, constraints) {
                int visibleCount = 3;
                if (constraints.maxWidth < 600) {
                  visibleCount = 3;
                } else if (constraints.maxWidth < 800) {
                  visibleCount = 4;
                } else if (constraints.maxWidth < 1000) {
                  visibleCount = 5;
                } else {
                  visibleCount = 6;
                }

                return ExpandableTheme(
                  data: ExpandableThemeData(
                    context,
                    contentPadding: const EdgeInsets.all(20),
                    expandedBorderColor: Colors.transparent,
                    paginationSize: 48,
                    headerHeight: 56,
                    headerColor: Colors.blue,
                    headerBorder: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    evenRowColor: const Color(0xFFFFFFFF),
                    oddRowColor: const Color(0xFFFFFFFF),
                    rowBorder: const BorderSide(
                      color: Colors.black,
                      width: 0.3,
                    ),
                    rowColor: Colors.green,
                    headerTextMaxLines: 4,
                    headerSortIconColor: const Color(0xFF6c59cf),
                    paginationSelectedFillColor: const Color(0xFF6c59cf),
                    paginationSelectedTextColor: Colors.white,
                  ),
                  child: ExpandableDataTable(
                    headers: headers,
                    rows: rows,
                    multipleExpansion: false,
                    isEditable: false,
                    onRowChanged: (newRow) {
                      print(newRow.cells[01].value);
                    },
                    onPageChanged: (page) {
                      print(page);
                    },
                    renderEditDialog: (row, onSuccess) =>
                        _buildEditDialog(row, onSuccess),
                    visibleColumnCount: visibleCount,
                  ),
                );
              })
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildEditDialog(
      ExpandableRow row, Function(ExpandableRow) onSuccess) {
    return AlertDialog(
      title: SizedBox(
        height: 300,
        child: TextButton(
          child: const Text("Change name"),
          onPressed: () {
            row.cells[1].value = "Updated name";
            onSuccess(row);
          },
        ),
      ),
    );
  }
}
