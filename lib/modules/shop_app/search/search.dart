import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchSecreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
        ),

      ),
      body: Center(
        child: Text(
          'Search Screen',
        ),
      ),
    );
  }

}