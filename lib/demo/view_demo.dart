import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold,),
              ),
              Text(
                posts[index].author,
                style: TextStyle(color: Colors.grey[300]),
              )
            ],
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return  List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return  List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 3,
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      // pageSnapping: false,
      // reverse: true,
      // scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
        initialPage: 1,
        keepPage: false,
        viewportFraction: 0.86
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        )
      ],
    );
  }
}
