import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationDemoController = AnimationController(
      // Lorem reprehenderit consequat eu velit duis mollit dolor ipsum quis deserunt.
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);

    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    // animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(animationDemoController);

    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    // animationDemoController.addListener(() {
    //   // print('${animationDemoController.value}');
    //   setState(() {
        
    //   });
    // });

    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // animationDemoController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ActionChip(
      //   label: Text('${animationDemoController.value}'),
      //   onPressed: () {
      //     animationDemoController.forward();
      //   }
      // ),
      // child: IconButton(
      //   icon: Icon(Icons.favorite),
      //   iconSize: animation.value,
      //   color: animationColor.value,
      //   onPressed: () {
      //     // animationDemoController.forward();
      //     switch (animationDemoController.status) {
      //       case AnimationStatus.completed:
      //         animationDemoController.reverse();
      //         break;
      //       default:
      //         animationDemoController.forward();
      //     }
      //   }
      // ),
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      }
    );
  }
}
