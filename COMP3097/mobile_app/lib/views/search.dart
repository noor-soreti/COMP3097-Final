import 'package:flutter/material.dart';
import 'package:mobile_app/src/user_service.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  UserService _service = UserService();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userModel = Provider.of<UserModel?>(context);

    // _service.readData().then((value) => print(value));

    return const Column(
      children: [Text('hello')],
    );
  }
}
