import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Mango',
    'Lemon'
  ];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life')
                ),
                // SizedBox(width: 8.0,),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                // SizedBox(width: 8.0,),
                Chip(
                  label: Text('Phonix'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('叶'),
                  ),
                ),
                // SizedBox(width: 8.0,),
                Chip(
                  label: Text('Jun'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://upload.jianshu.io/users/upload_avatars/13464654/d894f284-9c41-4160-a65f-8d3291c5fd08.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/120/h/120'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag?',
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                    (tag) {
                      return Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      );
                    }
                  ).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                    (tag) {
                      return ActionChip(
                        label: Text(tag),
                        onPressed: () {
                          setState(() {
                            _action = tag;
                          });
                        },
                      );
                    }
                  ).toList(),
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: $_selected'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                    (tag) {
                      return FilterChip(
                        label: Text(tag),
                        selected: _selected.contains(tag),
                        onSelected: (value) {
                          if (_selected.contains(tag)) {
                            setState(() {
                              _selected.remove(tag);
                            });
                          } else {
                            setState(() {
                              _selected.add(tag);
                            });
                          }
                        },
                      );
                    }
                  ).toList(),
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map(
                    (tag) {
                      return ChoiceChip(
                        label: Text(tag),
                        selectedColor: Colors.black,
                        selected: _choice == tag,
                        onSelected: (value) {
                          setState(() {
                            _choice = tag;
                          });
                        },
                      );
                    }
                  ).toList(),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Mango'
            ];
            _selected = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
