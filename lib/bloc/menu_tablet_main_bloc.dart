import 'package:rxdart/rxdart.dart';

class MenuTabletMainBloc {
  bool showFirstPageOnWaiter = false;
  int indexOfPageOnWaiter = 0;
  bool toShowSaveFirst = false;

  // main pager
  final _waiterThirdPageReloadSubject = PublishSubject<bool>();
  Stream<bool> get waiterThirdPageReloadStream =>
      _waiterThirdPageReloadSubject.stream;
  Sink<bool> get waiterThirdPageReloadSink =>
      _waiterThirdPageReloadSubject.sink;

  // item selected and refresh the third panel screen of kitchen
  final _kitchenThirdPageReloadSubject = PublishSubject<bool>();
  Stream<bool> get kitchenThirdPageReloadStream =>
      _kitchenThirdPageReloadSubject.stream;
  Sink<bool> get kitchenThirdPageReloadSink =>
      _kitchenThirdPageReloadSubject.sink;

  // change waiter table Name screenand table detail screen
  final _showWaiterTableDetailScreenSubject = PublishSubject<bool>();
  Stream<bool> get showWaiterTableDetailScreenStream =>
      _showWaiterTableDetailScreenSubject.stream;
  Sink<bool> get showWaiterTableDetailScreenSink =>
      _showWaiterTableDetailScreenSubject.sink;

  // edit menu on waiter screen
  final _editMenuSubject = PublishSubject<bool> ();
  Stream<bool> get editMenuStream => _editMenuSubject.stream;
  Sink<bool> get editMenuSink => _editMenuSubject.sink;

  saveFirst(bool value){
    toShowSaveFirst = value;
  }

  dispose() {
    _waiterThirdPageReloadSubject.close();
    _kitchenThirdPageReloadSubject.close();
    _showWaiterTableDetailScreenSubject.close();
    _editMenuSubject.close();
  }
}
