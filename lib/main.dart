import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_tablet/app_screens/shop_domain_login_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MenuTabletMainBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = MenuTabletMainBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.light(
          primary: HexColor(primaryColor),
        ),
      ),
      home: ShopDomainLoginScreen(
        bloc: bloc,
      ),
    );
  }
}
