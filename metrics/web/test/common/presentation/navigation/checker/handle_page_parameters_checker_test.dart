// Use of this source code is governed by the Apache License, Version 2.0
// that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:metrics/common/presentation/navigation/checker/handle_page_parameters_checker.dart';
import 'package:metrics/common/presentation/navigation/route_configuration/route_configuration.dart';

void main() {
  group("HandlePageParametersChecker", () {
    final routeConfigurationDashboard = RouteConfiguration.dashboard();
    final routeConfigurationLogin = RouteConfiguration.login();
    final HandlePageParametersChecker handlePageParametersChecker =
        HandlePageParametersChecker();

    test(
      "throws an ArgumentError if the given configuration is null",
      () {
        expect(
          () => handlePageParametersChecker.canHandle(
            configuration: null,
          ),
          throwsArgumentError,
        );
      },
    );

    test(
      ".canHandle() returns true if the page is a dashboard and PageNotifier is ProjectMetricsNotifier",
      () {
        final actualValue = handlePageParametersChecker.canHandle(
          configuration: routeConfigurationDashboard,
        );

        expect(actualValue, isTrue);
      },
    );

    test(
      ".canHandle() returns false if the page is not a dashboard or PageNotifier is not ProjectMetricsNotifier",
      () {
        final actualValue = handlePageParametersChecker.canHandle(
          configuration: routeConfigurationLogin,
        );

        expect(actualValue, isFalse);
      },
    );
  });
}
