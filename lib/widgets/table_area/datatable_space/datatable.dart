import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/member.dart' as member;
import '../../../states/table_area/members.dart' as members;
import '../../../states/table_area/row_selected.dart' as row_selected;
import '../../../states/table_area/table_sort.dart' as table_sort;

// DataTable
class MyDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rows
    final _memberList =
        context.select((members.Members store) => store.memberList);
    final pageMaxRows = 7;

    // Sort
    final _tableSort = context.read<table_sort.TableSort>();
    final _currentSortColumn =
        context.select((table_sort.TableSort store) => store.currentSortColumn);
    final _isAscending =
        context.select((table_sort.TableSort store) => store.isAscending);

    return PaginatedDataTable(
      arrowHeadColor: Colors.black,
      showCheckboxColumn: true,
      rowsPerPage:
          (_memberList.length < pageMaxRows) ? _memberList.length : pageMaxRows,
      sortColumnIndex: _currentSortColumn,
      sortAscending: _isAscending,
      columns: <DataColumn>[
        DataColumn(
            label: Text(
              'Name',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            onSort: (columnIndex, ascending) {
              _tableSort.setSortColumn(columnIndex);
              _tableSort.setAscending(ascending);

              if (ascending) {
                _memberList.sort((a, b) => a.name.compareTo(b.name));
              } else {
                _memberList.sort((a, b) => b.name.compareTo(a.name));
              }
            }),
        DataColumn(
            label: Text(
              'Age',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            onSort: (columnIndex, ascending) {
              _tableSort.setSortColumn(columnIndex);
              _tableSort.setAscending(ascending);

              if (ascending) {
                _memberList.sort((a, b) => a.age.compareTo(b.age));
              } else {
                _memberList.sort((a, b) => b.age.compareTo(a.age));
              }
            }),
        DataColumn(
            label: Text(
              'Role',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            onSort: (columnIndex, ascending) {
              _tableSort.setSortColumn(columnIndex);
              _tableSort.setAscending(ascending);

              if (ascending) {
                _memberList.sort((a, b) => a.job.compareTo(b.job));
              } else {
                _memberList.sort((a, b) => b.job.compareTo(a.job));
              }
            }),
      ],
      source: MembersDataSource(_memberList, context),
    );
  }
}

class MembersDataSource extends DataTableSource {
  List<member.Member> _membersList = <member.Member>[];
  final BuildContext context;

  MembersDataSource(this._membersList, this.context);

  @override
  DataRow getRow(int index) {
    final member.Member _member = _membersList[index];

    final _selected =
        context.select((row_selected.RowSelected store) => store.selectedIndex);

    return DataRow.byIndex(
      index: index,
      selected: _selected.contains(index),
      onSelectChanged: (bool? _selected) {
        context.read<row_selected.RowSelected>().setSelectedIndex(index);
      },
      cells: <DataCell>[
        DataCell(Container(width: 150, child: Text(_member.name))),
        DataCell(Container(width: 50, child: Text(_member.age.toString()))),
        DataCell(Container(width: 150, child: Text(_member.job))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _membersList.length;

  @override
  int get selectedRowCount => context
      .select((row_selected.RowSelected selected) => selected.selectedCount());
}
