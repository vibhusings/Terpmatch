import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:umddating/main.dart';
import 'package:provider/provider.dart';
import 'package:umddating/screens/Home/home.dart';
import 'package:umddating/Models/user.dart';

import '../Home/home.dart';
import '../Models/user.dart';
import 'authentication/authenticate.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FbUser?>(context);
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
