import 'package:finitestatemachine/screen/contact/contact_screen.dart';
import 'package:finitestatemachine/screen/contact/contact_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ContactViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactScreen(),
      ),
    ),
  );
}
