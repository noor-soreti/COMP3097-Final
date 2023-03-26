// import 'package:flutter/material.dart';
// import 'package:mobile_app/views/login_screen.dart';
// import 'package:mobile_app/views/main_screen.dart';
// import 'package:provider/provider.dart';

// class Likes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var favourite = appState.favourites;

//     if (favourite.isEmpty) {
//       return Center(
//         child: Text("No likes"),
//       );
//     }

//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('You have `${favourite.length}` favourites:'),
//         ),
//         for (var fav in favourite)
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text("Likes"),
//           )
//       ],
//     );
//   }
// }
