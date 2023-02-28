import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_table/json_table.dart';
import 'package:ssk_resource_manager/src/constants/color_provider.dart';
import 'package:ssk_resource_manager/src/constants/json_data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _items = [];

  String _hystoryData = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('test_table.json');
    final data = await json.decode(response);
    _items = data['data'];
  }

  @override
  void initState() {
    //readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProvider.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.account_tree_outlined, color: ColorProvider.primaryColor, size: 30),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Get data from DB',
                              style: TextStyle(
                                color: ColorProvider.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.picture_as_pdf, color: ColorProvider.primaryColor, size: 30),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Export to PDF',
                              style: TextStyle(
                                color: ColorProvider.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.supervised_user_circle_outlined, color: ColorProvider.primaryColor, size: 30),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Users',
                              style: TextStyle(
                                color: ColorProvider.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(50)),
                      color: ColorProvider.primaryColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: ColorProvider.centerColor,
                            ),
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  JsonTable(
                                    jsonDecode(JsonDataProvider.jsonMainData),
                                    showColumnToggle: true,
                                    allowRowHighlight: true,
                                    rowHighlightColor: Colors.yellow[500]!.withOpacity(0.7),
                                    paginationRowCount: 20,
                                    onRowSelect: (index, map) {
                                      print(index);
                                      print(map);
                                      setState(() {
                                        _hystoryData = map.toString();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Details'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(_hystoryData),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                              color: ColorProvider.primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Text('HANDLER'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
