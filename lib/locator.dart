import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_service_pattern/locator.config.dart';
import 'package:hive_service_pattern/services/hive_service.dart';
import 'package:hive_service_pattern/services/photo_gallery_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

final GetIt locator = GetIt.instance;

@injectableInit
void setupLocatorThirdParty() => $initGetIt(locator);

Future setupLocator() async {
  setupLocatorThirdParty();
  //STEP 3. Initialiaze Hive
  //This will call init method in HiveService for first load
  await Hive.initFlutter();

  //regiser locator for Hive Service
  locator.registerLazySingleton<HiveService>(() => HiveService());

  locator.registerLazySingleton<PhotoGalleryRepository>(
      () => PhotoGalleryRepository());
}
