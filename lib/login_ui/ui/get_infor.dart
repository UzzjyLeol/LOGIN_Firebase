import 'color_set.dart';
import 'package:flutter/material.dart';


class GetInfor extends StatelessWidget {
  const GetInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                            //Khối Uername
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 140,right: 140),
          child:  
          TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w400
            ),
            obscureText: false,
            decoration: InputDecoration(
              hoverColor: const Color.fromARGB(255, 45, 55, 56),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: ColorSet.borderTextField,
                  width: 2.0,
                ),
              ),
              labelText: null,
              hintText: 'Username',
              hintStyle: const TextStyle(
                color: ColorSet.hintText_,
                letterSpacing: 1,
                fontSize: 18
              )
            ),
          ),
        ),
        const SizedBox(height: 14,),
                            //Khối Password
        Padding(
          padding: const EdgeInsets.fromLTRB(140, 12, 140, 12),
          child: TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white60
            ),
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: ColorSet.borderTextField,
                  width: 2.0,
                )
              ),
              labelText: null,
              hintText: "Password",
              hintStyle: const TextStyle(
                color: ColorSet.hintText_,
                letterSpacing: 1,
                fontSize: 18
              )
            ),
          ),
        ),
      ],
    );
  }

}