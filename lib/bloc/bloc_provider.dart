import 'package:flutter/material.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';

class MenuTabletMainBlocProvider extends InheritedWidget {
  final MenuTabletMainBloc bloc;
  const MenuTabletMainBlocProvider({
    Key key,
    @required this.bloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MenuTabletMainBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MenuTabletMainBlocProvider)
            as MenuTabletMainBlocProvider)
        .bloc;
  }
}
