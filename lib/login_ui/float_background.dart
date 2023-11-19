import 'package:flutter/material.dart';

import 'color_set.dart';

class FloatingBackground extends StatelessWidget {
  const FloatingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return 
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(42),
                  decoration:const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorSet.gradientColor3,ColorSet.gradientColor4],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                      ),
                    
                  ),
                ),
              );

  }

}