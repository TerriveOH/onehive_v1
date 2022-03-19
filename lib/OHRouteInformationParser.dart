//Import core
import 'dart:developer';

import 'package:flutter/material.dart';

//Import utilities
import 'utiities/Config.dart';

class OHRouteInformationParser extends RouteInformationParser<OHConfig> {
  @override
  Future<OHConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    try {
      if (uri.pathSegments.length == 0) {
        return OHConfig.landing();
      } else if (uri.pathSegments.length == 1) {
        final first = uri.pathSegments[0].toLowerCase();
        if (first == 'register') {
          return OHConfig.register();
        } else if (first == 'login') {
          return OHConfig.login();
        } else if (first == 'signin') {
          return OHConfig.login();
        } else if (first == 'home') {
          return OHConfig.landing();
        } else if (first == 'signup') {
          return OHConfig.register();
        } else if (first == 'resetPassword') {
          return OHConfig.resetPassword();
        } else if (first == 'forgottPassword') {
          return OHConfig.resetPassword();
        } else if (first == 'explore') {
          return OHConfig.pollExplore('all');
        } else if (first == 'polls') {
          return OHConfig.pollExplore('all');
        }
      } else if (uri.pathSegments.length == 2) {
        final first = uri.pathSegments[0].toLowerCase();
        final second = uri.pathSegments[1].toLowerCase();
        if (first == 'explore') {
          return OHConfig.pollExplore(second);
        } else if (first == 'polls') {
          return OHConfig.pollExplore(second);
        } else if (first == 'poll') {
          return OHConfig.pollDetail(second);
        }
      } else {
        return OHConfig.error();
      }
    } on Exception catch (e) {
      print(e);
    }
    throw Exception('Exception');
  }

  @override
  RouteInformation? restoreRouteInformation(OHConfig configuration) {
    if (configuration.isUnknownPage) {
      return const RouteInformation(location: '/error404');
    } else if (configuration.isLandingPage) {
      return const RouteInformation(location: '/');
    } else if (configuration.isLoginPage) {
      return const RouteInformation(location: '/login');
    } else if (configuration.isLostPasswordPage) {
      return const RouteInformation(location: '/resetPassword');
    } else if (configuration.isPollDetail) {
      return RouteInformation(location: '/poll/${configuration.pollCode}');
    } else if (configuration.isPollExplore) {
      return RouteInformation(location: '/polls/${configuration.pollCategory}');
    } else if (configuration.isRegisterPage) {
      return const RouteInformation(location: '/register');
    } else if (configuration.isLoadingPage) {
      return null;
    } else {
      return null;
    }
  }
}
