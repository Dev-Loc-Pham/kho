import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/favourite.dart';
import 'package:flutter_layout/screens/myhomepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/service/appstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Widget page = MyHomePage();
int page_num = 0;

void PageChange() {
  if (page_num == 0) {
    page = MyHomePage();
  } else {
    page = FavouritePage();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppSate(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Testing Sample'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        page_num = page_num == 0 ? 1 : 0;
                        PageChange();
                        print(page_num);
                      });
                    },
                    icon: Icon(Icons.favorite_border),
                    label: Text('Favourite')),
              ],
            ),
            body: page,
          )),
    );
  }
}

class AppSate extends ChangeNotifier {
  var favourite = [];
  void add_ele(int e) {
    if (favourite.contains(e)) {
      print('it already have');
    } else {
      favourite.add(e);
      notifyListeners();
    }
  }

  void remove_ele(int e) {
    favourite.remove(e);
    notifyListeners();
  }
}
