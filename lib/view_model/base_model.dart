import '/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class BaseModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  NavigationService get navigationService => _navigationService;

  bool _wait = false;
  bool get wait => _wait;

  void setWait(bool value) {
    _wait = value;
    notifyListeners();
  }
}
