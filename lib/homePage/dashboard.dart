import 'package:flutter/material.dart';

class ReorderList extends StatefulWidget {
  const ReorderList({Key? key}) : super(key: key);

  @override
  State<ReorderList> createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ReorderableListView(
          buildDefaultDragHandles:
              false, //<-- set this to false to avoid build draghandle
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              ListTile(
                key: Key(index.toString()), //<-- use key
                title: Text(_items[index].toString()),
                leading: ReorderableDragStartListener(
                  //<-- add this to leading
                  index: index,
                  child: Icon(Icons.drag_handle),
                ),
              )
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
        ));
  }
}
