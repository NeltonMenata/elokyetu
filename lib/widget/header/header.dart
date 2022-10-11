// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';

List<Widget> buildHeader() => [
      Row(
        children: [
          Text(
            'Salas',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              // Get.to(Entrar());
            },
            child: Text(
              'mais',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ];
