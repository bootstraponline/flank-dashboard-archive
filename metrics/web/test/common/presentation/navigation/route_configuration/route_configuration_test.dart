// Use of this source code is governed by the Apache License, Version 2.0
// that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:metrics/common/presentation/navigation/constants/default_routes.dart';
import 'package:metrics/common/presentation/navigation/route_configuration/route_configuration.dart';
import 'package:metrics/common/presentation/navigation/route_configuration/route_name.dart';
import 'package:test/test.dart';

void main() {
  group("RouteConfiguration", () {
    const parameters = {'test': 'test'};

    test(
      ".loading() creates an instance with the loading route name",
      () {
        const expectedName = RouteName.loading;

        const configuration = RouteConfiguration.loading();

        expect(configuration.name, equals(expectedName));
      },
    );

    test(
      ".loading() creates an instance with the loading route path",
      () {
        const expectedPath = Navigator.defaultRouteName;

        const configuration = RouteConfiguration.loading();

        expect(configuration.path, equals(expectedPath));
      },
    );

    test(
      ".loading() creates an instance with the correct authorization required value",
      () {
        const expectedAuthorizationRequired = false;

        const configuration = RouteConfiguration.loading();

        expect(
          configuration.authorizationRequired,
          equals(expectedAuthorizationRequired),
        );
      },
    );

    test(
      ".loading() creates an instance with the correct allows anonymous access value",
      () {
        const expectedAllowsAnonymousAccess = true;

        const configuration = RouteConfiguration.loading();

        expect(
          configuration.allowsAnonymousAccess,
          equals(expectedAllowsAnonymousAccess),
        );
      },
    );

    test(
      ".loading() creates an instance with the parameters map equal to null",
      () {
        const configuration = RouteConfiguration.loading();

        expect(configuration.parameters, isNull);
      },
    );

    test(
      ".login() creates an instance with the login route name",
      () {
        const expectedName = RouteName.login;

        final configuration = RouteConfiguration.login();

        expect(configuration.name, equals(expectedName));
      },
    );

    test(
      ".login() creates an instance with the login route path",
      () {
        final expectedPath = '/${RouteName.login}';

        final configuration = RouteConfiguration.login();

        expect(configuration.path, equals(expectedPath));
      },
    );

    test(
      ".login() creates an instance with the correct authorization required value",
      () {
        const expectedAuthorizationRequired = false;

        final configuration = RouteConfiguration.login();

        expect(
          configuration.authorizationRequired,
          equals(expectedAuthorizationRequired),
        );
      },
    );

    test(
      ".login() creates an instance with the correct allows anonymous access value",
      () {
        const expectedAllowsAnonymousAccess = true;

        final configuration = RouteConfiguration.login();

        expect(
          configuration.allowsAnonymousAccess,
          equals(expectedAllowsAnonymousAccess),
        );
      },
    );

    test(
      ".login() creates an instance with the given parameters",
      () {
        final configuration = RouteConfiguration.login(parameters: parameters);

        expect(configuration.parameters, equals(parameters));
      },
    );

    test(
      ".dashboard() creates an instance with the dashboard route name",
      () {
        const expectedName = RouteName.dashboard;

        final configuration = RouteConfiguration.dashboard();

        expect(configuration.name, equals(expectedName));
      },
    );

    test(
      ".dashboard() creates an instance with the dashboard route path",
      () {
        final expectedPath = '/${RouteName.dashboard}';

        final configuration = RouteConfiguration.dashboard();

        expect(configuration.path, equals(expectedPath));
      },
    );

    test(
      ".dashboard() creates an instance with the correct authorization required value",
      () {
        const expectedAuthorizationRequired = true;

        final configuration = RouteConfiguration.dashboard();

        expect(
          configuration.authorizationRequired,
          equals(expectedAuthorizationRequired),
        );
      },
    );

    test(
      ".dashboard() creates an instance with the correct allows anonymous access value",
      () {
        const expectedAllowsAnonymousAccess = true;

        final configuration = RouteConfiguration.dashboard();

        expect(
          configuration.allowsAnonymousAccess,
          equals(expectedAllowsAnonymousAccess),
        );
      },
    );

    test(
      ".dashboard() creates an instance with the given parameters",
      () {
        final configuration = RouteConfiguration.dashboard(
          parameters: parameters,
        );

        expect(configuration.parameters, equals(parameters));
      },
    );

    test(
      ".projectGroups() creates an instance with the project groups route name",
      () {
        const expectedName = RouteName.projectGroups;

        final configuration = RouteConfiguration.projectGroups();

        expect(configuration.name, equals(expectedName));
      },
    );

    test(
      ".projectGroups() creates an instance with the project groups route path",
      () {
        final expectedPath = '/${RouteName.projectGroups}';

        final configuration = RouteConfiguration.projectGroups();

        expect(configuration.path, equals(expectedPath));
      },
    );

    test(
      ".projectGroups() creates an instance with the correct authorization required value",
      () {
        const expectedAuthorizationRequired = true;

        final configuration = RouteConfiguration.projectGroups();

        expect(
          configuration.authorizationRequired,
          equals(expectedAuthorizationRequired),
        );
      },
    );

    test(
      ".projectGroups() creates an instance with the correct allows anonymous access value",
      () {
        const expectedAllowsAnonymousAccess = false;

        final configuration = RouteConfiguration.projectGroups();

        expect(
          configuration.allowsAnonymousAccess,
          equals(expectedAllowsAnonymousAccess),
        );
      },
    );

    test(
      ".projectGroups() creates an instance with the given parameters",
      () {
        final configuration = RouteConfiguration.projectGroups(
          parameters: parameters,
        );

        expect(configuration.parameters, equals(parameters));
      },
    );

    test(
      ".debugMenu() creates an instance with the debug menu route name",
      () {
        const expectedName = RouteName.debugMenu;

        final configuration = RouteConfiguration.debugMenu();

        expect(configuration.name, equals(expectedName));
      },
    );

    test(
      ".debugMenu() creates an instance with the debug menu route path",
      () {
        final expectedPath = '/${RouteName.debugMenu}';

        final configuration = RouteConfiguration.debugMenu();

        expect(configuration.path, equals(expectedPath));
      },
    );

    test(
      ".debugMenu() creates an instance with the correct authorization required value",
      () {
        const expectedAuthorizationRequired = true;

        final configuration = RouteConfiguration.debugMenu();

        expect(
          configuration.authorizationRequired,
          equals(expectedAuthorizationRequired),
        );
      },
    );

    test(
      ".debugMenu() creates an instance with the correct allows anonymous access value",
      () {
        const expectedAllowsAnonymousAccess = true;

        final configuration = RouteConfiguration.debugMenu();

        expect(
          configuration.allowsAnonymousAccess,
          equals(expectedAllowsAnonymousAccess),
        );
      },
    );

    test(
      ".debugMenu() creates an instance with the given parameters",
      () {
        final configuration = RouteConfiguration.debugMenu(
          parameters: parameters,
        );

        expect(configuration.parameters, equals(parameters));
      },
    );

    test(
      ".values contains all route configurations",
      () {
        final expectedValues = {
          DefaultRoutes.loading,
          DefaultRoutes.login,
          DefaultRoutes.dashboard,
          DefaultRoutes.projectGroups,
          DefaultRoutes.debugMenu,
        };

        final values = RouteConfiguration.values;

        expect(values, equals(expectedValues));
      },
    );

    test(
      "equals to another RouteConfiguration with the same parameters",
      () {
        final configuration = RouteConfiguration.dashboard(
          parameters: parameters,
        );

        final anotherConfiguration = RouteConfiguration.dashboard(
          parameters: parameters,
        );

        expect(configuration, equals(anotherConfiguration));
      },
    );

    test(
      ".copyWith() creates a new instance with the same fields if called without parameters",
      () {
        final configuration = RouteConfiguration.dashboard(
          parameters: parameters,
        );

        final copiedConfiguration = configuration.copyWith();

        expect(configuration, equals(copiedConfiguration));
      },
    );

    test(
      ".copyWith() creates a copy of an instance with the given fields replaced with the new values",
      () {
        const newName = RouteName.dashboard;
        const newPath = 'test_path2';
        const newAuthorizationRequired = true;
        const newAllowsAnonymousAccess = false;
        const newParameters = {'test2': 'test2'};

        final configuration = RouteConfiguration.dashboard(
          parameters: parameters,
        );

        final copiedConfiguration = configuration.copyWith(
          name: newName,
          path: newPath,
          authorizationRequired: newAuthorizationRequired,
          allowsAnonymousAccess: newAllowsAnonymousAccess,
          parameters: newParameters,
        );

        expect(copiedConfiguration.name, equals(newName));
        expect(copiedConfiguration.path, equals(newPath));
        expect(
          copiedConfiguration.authorizationRequired,
          equals(newAuthorizationRequired),
        );
        expect(
          copiedConfiguration.allowsAnonymousAccess,
          equals(newAllowsAnonymousAccess),
        );
        expect(copiedConfiguration.parameters, equals(newParameters));
      },
    );
  });
}
