import 'package:cloud_storage/core/routes/named_routes.dart';
import 'package:cloud_storage/core/routes/routes_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Named routes", () {
    testWidgets('Compare named routes with Pages List', (tester) async {
      final List<String> routesNames = NamedRoutes().getRoutesNames();
      final List<String> pageNames = RoutesConfig().getPageNames();
      routesNames.sort();
      pageNames.sort();

      expect(true, listEquals(routesNames, pageNames));
    });
  });
}
