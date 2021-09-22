import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyService {
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  BottomSheetService get bottomSheetService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  NavigationService get navigationService;
}
