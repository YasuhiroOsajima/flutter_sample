import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/members.dart' as members;
import '../states/row_selected.dart' as row_selected;
import '../states/table_sort.dart' as table_sort;

// DataTable
class MyDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _memberList =
        context.select((members.Members store) => store.memberList);
    final _currentSortColumn =
        context.select((table_sort.TableSort store) => store.currentSortColumn);
    final _isAscending =
        context.select((table_sort.TableSort store) => store.isAscending);

    List<DataRow> parseRows() {
      List<DataRow> memberRows = [];
      _memberList.asMap().forEach(
            (index, element) => memberRows.add(
              DataRow(
                selected: context.select((row_selected.RowSelected selected) =>
                    selected.isSelected(index)),
                onSelectChanged: (bool? _selected) {
                  var _row_selected_obj =
                      context.read<row_selected.RowSelected>();
                  _row_selected_obj.setSelectedIndex(index);
                },
                cells: <DataCell>[
                  DataCell(Container(width: 150, child: Text(element.name))),
                  DataCell(Container(
                      width: 50, child: Text(element.age.toString()))),
                  DataCell(Container(width: 150, child: Text(element.job))),
                ],
              ),
            ),
          );

      return memberRows;
    }

    return DataTable(
      sortColumnIndex: _currentSortColumn,
      sortAscending: _isAscending,
      showCheckboxColumn: true,
      columns: <DataColumn>[
        DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            onSort: (columnIndex, ascending) {
              var _table_sort = context.read<table_sort.TableSort>();
              _table_sort.setSortColumn(columnIndex);
              _table_sort.setAscending(ascending);

              if (columnIndex == 0) {
                if (ascending) {
                  _memberList.sort((a, b) => a.name.compareTo(b.name));
                } else {
                  _memberList.sort((a, b) => b.name.compareTo(a.name));
                }
              }
            }),
        DataColumn(
          label: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Role',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: parseRows(),
    );
  }
}
