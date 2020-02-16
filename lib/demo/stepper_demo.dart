import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ),
              child: Stepper(
                currentStep: _currentStep ,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep = _currentStep < 2 ? _currentStep + 1 : 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep = _currentStep > 0 ? _currentStep - 1 : 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('login first'),
                    content: Text('Aute excepteur minim id laboris voluptate sit id consectetur eu ex excepteur veniam amet minim.'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose your Plan'),
                    content: Text('Esse dolor aliqua laboris cupidatat pariatur consectetur officia.'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('Confirm Payment'),
                    subtitle: Text('Confirm your Payment'),
                    content: Text('Officia est fugiat reprehenderit ullamco aliqua nostrud ut consequat officia ipsum excepteur velit.'),
                    isActive: _currentStep == 2,
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
