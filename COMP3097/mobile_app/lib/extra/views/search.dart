import 'package:flutter/material.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/extra/models/user_model.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/src/auth_service.dart';
import 'package:mobile_app/src/user_service.dart';
import 'package:provider/provider.dart';

import '../../database/models.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel?>(context);
    print(userModel);

    return const Column(
      children: [Text('hello')],
    );
  }
}
