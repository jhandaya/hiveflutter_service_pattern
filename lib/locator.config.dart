// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import 'services/third_party_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyService = _$ThirdPartyService();
  gh.lazySingleton<_i3.BottomSheetService>(
      () => thirdPartyService.bottomSheetService);
  gh.lazySingleton<_i3.DialogService>(() => thirdPartyService.dialogService);
  gh.lazySingleton<_i3.NavigationService>(
      () => thirdPartyService.navigationService);
  gh.lazySingleton<_i3.SnackbarService>(
      () => thirdPartyService.snackbarService);
  return get;
}

class _$ThirdPartyService extends _i4.ThirdPartyService {
  @override
  _i3.BottomSheetService get bottomSheetService => _i3.BottomSheetService();
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
  @override
  _i3.SnackbarService get snackbarService => _i3.SnackbarService();
}
