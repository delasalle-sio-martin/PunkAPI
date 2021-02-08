import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Created by Alexis MARTIN during a Flutter course'),
      ),
    );
  }

}