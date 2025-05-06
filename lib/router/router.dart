// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:weather_app/screen_factory/screen_factory.dart';

/// Класс содержит маршруты навигации
abstract class NavigationRoutes {
  /// Корееной маршрут
  static const root = '/';

  /// Маршрут экрана с информацией о приложении
  static const about = '/about';

  /// Маршрут экрана с погодными предупреждениями
  static const alerts = '/alerts';

  /// Маршрут экрана с поиском локации
  static const locationSearch = '/location_search';

  /// Маршрут экрана с камерой
  static const camera = '/camera';
}

/// Класс содержит информацию о навигации в приложениии
class MainNavigationRouter {
  final _screenFactory = ScreenFactory();

  /// Навигационные маршруты
  Map<String, WidgetBuilder> get routes => {
    NavigationRoutes.root: (_) => _screenFactory.makeRootScreen(),
    NavigationRoutes.about: (_) => _screenFactory.makeAboutScreen(),
    NavigationRoutes.alerts: (_) => _screenFactory.makeWeatherAlertsScreen(),
    NavigationRoutes.locationSearch:
        (_) => _screenFactory.makeLocationSearchScreen(),
    NavigationRoutes.camera: (_) => _screenFactory.makeWeatherCameraScreen(),
  };

  /// Метод вызывается при переходе на несуществующий маршрут
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    return null;
  }
}
