import 'package:flutter/material.dart';
import 'package:hive_service_pattern/view/myphotos_add_view.dart';
import 'package:hive_service_pattern/view/myphotos_gallery_view.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String routeName = settings.name!;
    switch (routeName) {
      case "PhotosView":
        return _getPageRoute(
          routeName: routeName,
          viewToShow: MyPhotosGalleryView(),
        );
      case "AddView":
        return _getPageRoute(
          routeName: routeName,
          viewToShow: MyPhotosAddView(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => viewToShow);
  }
}
