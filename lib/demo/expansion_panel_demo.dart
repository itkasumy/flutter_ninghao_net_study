import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expanelPanelItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expanelPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text(
            'Content for Panel A',
          ),
        ),
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text(
            'Content for Panel B',
          ),
        ),
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text(
            'Content for Panel C',
          ),
        ),
        isExpanded: false
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _expanelPanelItems[panelIndex].isExpanded = !_expanelPanelItems[panelIndex].isExpanded;
                });
              },
              children: _expanelPanelItems.map(
                (ExpansionPanelItem item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          item.headerText,
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    },
                    body: item.body,
                    isExpanded: item.isExpanded
                  );
                }
              ).toList(),
              // children: [
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text(
              //           'Panel A',
              //           style: Theme.of(context).textTheme.title,
              //         ),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text(
              //         'Content for Panel A',
              //       ),
              //     ),
              //     isExpanded: _isExpanded
              //   )
              // ],
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded
  });
}
