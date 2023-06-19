import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/services/product_service.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/login_screen.dart';
import 'package:provider/provider.dart';

import 'database/models.dart';

late MyDatabase database;

Future main() async {
  await dotenv.load(fileName: ".env");
  database = MyDatabase();
  // User user = await database.getUser('test');
  // List<Cart> cart = [];

  // List<Product> productList = await database.getAllProducts();

  // int count = 0;

  // while (count < 5) {
  //   productList.forEach((element) {
  //     print(element);
  //     cart.add(Cart(id: count, product: element.name, quantity: count++));
  //     count++;
  //   });
  // }

  // UserCart userCart = UserCart(user: user, cart: cart);

  // await database.userShoppingCart(userCart);

  // await database.getUserCart(user);

  runApp(MyApp());
}

/* 
Code in MyApp sets up the whole app. It creates the app-wide state, names the app, defines the visual theme, and sets the "home" widget—the starting point of your app.
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserService()),
          ChangeNotifierProvider(create: (context) => ShoppingListService()),
          ChangeNotifierProvider(create: (context) => ProductService()),
        ],
        child: MaterialApp(
          title: 'ShopU',
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: Color.fromRGBO(56, 160, 224, 0.438),
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: Color.fromRGBO(56, 160, 224, 0.438))
          ),
          home: Scaffold(
            appBar: AppBar(
                // title: const Text("ShopU"),
                ),
            body: LoginPage(),
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
