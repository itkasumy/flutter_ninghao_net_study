import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget _raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0)
              // ),
              shape: StadiumBorder()
            )
          ),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            elevation: 0.0,
            // color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
          )
        ),
        SizedBox(width: 16.0),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('Button'),
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget _outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0)
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textTheme: ButtonTextTheme.primary,
          )
        ),
        SizedBox(width: 16.0),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final Widget _fixedWithButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Container(
            width: 130.0,
            child: OutlineButton(
              onPressed: () {},
              child: Text('Button'),
              splashColor: Colors.grey[100],
              borderSide: BorderSide(
                color: Colors.black
              ),
              // color: Theme.of(context).accentColor,
              textColor: Colors.black,
              highlightedBorderColor: Colors.grey,
              // textTheme: ButtonTextTheme.primary,
            ),
          )
      ],
    );

    final Widget _expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textTheme: ButtonTextTheme.primary,
          ),
        )
      ],
    );

    final Widget _buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0)
            )
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                // color: Theme.of(context).accentColor,
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                // textTheme: ButtonTextTheme.primary,
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                // color: Theme.of(context).accentColor,
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                // textTheme: ButtonTextTheme.primary,
              )
            ],
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flatButtonDemo,
            _raisedButtonDemo,
            _outlineButtonDemo,
            _fixedWithButtonDemo,
            _expandedButtonDemo,
            _buttonBarDemo
          ],
        ),
      ),
    );
  }
}
