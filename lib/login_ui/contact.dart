import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            icon: const Icon(Icons.facebook,size: 18,),
            label: const Text(''),
          ),
          ElevatedButton.icon(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            icon: const Icon(Icons.access_alarm,size: 18,),
            label: const Text('')
          ),
          ElevatedButton.icon(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            icon: const Icon(Icons.g_translate_sharp,size: 18,),
            label: const Text('')
          ),
          ],
        );

    }

}