import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    final Post post = _posts[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imgUrl)),
      ]
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}

class PagenatedDemo extends StatefulWidget {
  @override
  _PagenatedDemoState createState() => _PagenatedDemoState();
}

class _PagenatedDemoState extends State<PagenatedDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagenatedDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              source: _postDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              rowsPerPage: 3,
              // onSelectAll: (bool value) {},
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnIndex, bool ascending) {
                    _postDataSource._sort((post) => post.title.length, ascending);
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                    });
                  }
                ),
                DataColumn(
                  label: Text('Author')
                ),
                DataColumn(
                  label: Text('Image')
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
