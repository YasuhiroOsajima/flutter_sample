import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/members.dart' as members;
import '../states/table_search.dart' as table_search;

class SearchSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedKey =
        context.select((table_search.TableSearch store) => store.selectedKey);

    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
        padding: EdgeInsets.only(right: 10.0),
        child: DropdownButton<String>(
          value: selectedKey,
          itemHeight: 92.0,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30,
          elevation: 8,
          style: TextStyle(fontSize: 20, color: Colors.black),
          underline: Container(
            height: 1,
            color: Colors.grey,
          ),
          onChanged: (newValue) {
            var _table_search = context.read<table_search.TableSearch>();
            _table_search.setSelectedKey(newValue.toString());
          },
          items: table_search.FilterType.map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      Container(
          padding: EdgeInsets.only(right: 50.0),
          width: 200.0,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            style: new TextStyle(
              fontSize: 20.0,
              height: 2.0,
              color: Colors.black,
            ),
            onChanged: (String event) {
              var memberListen = context.read<members.Members>();
              if (event.isEmpty) {
                memberListen.refresh();
              } else {
                if (selectedKey == "Name") {
                  memberListen.setNameFilterdMembers(event);
                } else if (selectedKey == "Age") {
                  memberListen.setAgeFilterdMembers(event);
                } else if (selectedKey == "Role") {
                  memberListen.setJobFilterdMembers(event);
                }
              }
            },
          )),
    ]);
  }
}
