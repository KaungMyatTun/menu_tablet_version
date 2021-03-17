import 'package:rxdart/rxdart.dart';

class MenuTabletMainBloc{
  bool showFirstPageOnWaiter = false;
  int indexOfPageOnWaiter = 0;

  // main pager
  final _waiterThirdPageReloadSubject = PublishSubject<bool>();
  Stream<bool> get waiterThirdPageReloadStream => _waiterThirdPageReloadSubject.stream;
  Sink<bool> get waiterThirdPageReloadSink => _waiterThirdPageReloadSubject.sink;

  dispose(){
    _waiterThirdPageReloadSubject.close();
  }
}