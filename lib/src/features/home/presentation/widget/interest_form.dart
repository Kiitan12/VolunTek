import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestForm extends StatelessWidget {
  const InterestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Form'),
      ),
      body: Column(
        children:  [
         Text('Describe yourself?')
        ],
      )
    );
  }
}
