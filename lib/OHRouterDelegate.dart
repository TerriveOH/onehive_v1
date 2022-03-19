import 'dart:core';
import 'package:onehive_v1/data/myAuth.dart';
import 'package:flutter/material.dart';
import 'utiities/Config.dart';

import 'pages/ErrorPage.dart';
import 'pages/ForgotPasswordPage.dart';
import 'pages/LoadingPage.dart';
import 'pages/LoginPage.dart';
import 'pages/PollDetailPage.dart';
import 'pages/PollsPage.dart';
import 'pages/RegisterPage.dart';
import 'pages/LadingPage.dart';

class OHRouterDelegate extends RouterDelegate<OHConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<OHConfig> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final myAuth authRepo;

  int _loggedIn = 0;
  int get loggedIn => _loggedIn;
  set loggedIn(int value) {
    if (_loggedIn == 2 && value == 1) {
      _clear();
    }
    _loggedIn = value;
    notifyListeners();
  }

  bool _show404 = false;
  bool get show404 => _show404;
  set show404(bool value) {
    _show404 = value;
    if (value == true) {}
    notifyListeners();
  }

  PageType _pageType = PageType.LOADING;
  PageType get pageType => _pageType;
  set pageType(PageType value) {
    _pageType = value;
    notifyListeners();
  }

  String _pollCode = '';
  String get pollCode => _pollCode;
  set pollCode(String value) {
    _pollCode = value;
    notifyListeners();
  }

  String _urlCategory = '';
  String get urlCategory => _urlCategory;
  set urlCategory(String value) {
    _urlCategory = value;
    notifyListeners();
  }

  OHRouterDelegate(this.authRepo) {
    _init();
  }

  _init() async {
    loggedIn = 1;
    pageType = PageType.LANDING;
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

  OHConfig get currentConfiguration {
    if (loggedIn == 0 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          return OHConfig.loading();
        case PageType.LANDING:
          return OHConfig.landing();
        case PageType.REGISTER:
          return OHConfig.register();
        case PageType.LOGIN:
          return OHConfig.login();
        case PageType.RESETPW:
          return OHConfig.resetPassword();
        case PageType.POLLDETAIL:
          return OHConfig.pollDetail(_pollCode);
        case PageType.UNKNOWN:
          return OHConfig.error();
        case PageType.POLLEXPLORE:
          return OHConfig.pollExplore(_urlCategory);
      }
    } else if (loggedIn == 2 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          return OHConfig.loading();
        case PageType.LANDING:
          return OHConfig.landing();
        case PageType.REGISTER:
          return OHConfig.register();
        case PageType.LOGIN:
          return OHConfig.login();
        case PageType.RESETPW:
          return OHConfig.resetPassword();
        case PageType.POLLDETAIL:
          return OHConfig.pollDetail(_pollCode);
        case PageType.POLLEXPLORE:
          return OHConfig.pollExplore(_urlCategory);
        case PageType.UNKNOWN:
          return OHConfig.error();
      }
    } else if (loggedIn == 1 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          return OHConfig.login();
        case PageType.LANDING:
          return OHConfig.landing();
        case PageType.REGISTER:
          return OHConfig.register();
        case PageType.LOGIN:
          return OHConfig.login();
        case PageType.RESETPW:
          return OHConfig.resetPassword();
        case PageType.POLLDETAIL:
          return OHConfig.login();
        case PageType.POLLEXPLORE:
          return OHConfig.pollExplore(_urlCategory);
        case PageType.UNKNOWN:
          return OHConfig.error();
      }
    } else {
      return OHConfig.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (show404 == true) {
      stack = _unknownStack;
    } else if (loggedIn == 0 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          stack = _loadingStack;
          break;
        case PageType.LANDING:
          stack = _landingStack;
          break;
        case PageType.REGISTER:
          stack = _registerStack;
          break;
        case PageType.LOGIN:
          stack = _loginStack;
          break;
        case PageType.RESETPW:
          stack = _resetPwStack;
          break;
        case PageType.POLLDETAIL:
          stack = _loginStack;
          break;
        case PageType.UNKNOWN:
          stack = _unknownStack;
          break;
        case PageType.POLLEXPLORE:
          stack = _exploreStack;
          break;
      }
    } else if (loggedIn == 2 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          stack = _loadingStack;
          break;
        case PageType.LANDING:
          stack = _landingStack;
          break;
        case PageType.REGISTER:
          stack = _exploreStack;
          break;
        case PageType.LOGIN:
          stack = _exploreStack;
          break;
        case PageType.RESETPW:
          stack = _exploreStack;
          break;
        case PageType.POLLDETAIL:
          stack = _pollDetailStack;
          break;
        case PageType.UNKNOWN:
          stack = _unknownStack;
          break;
        case PageType.POLLEXPLORE:
          stack = _exploreStack;
          break;
      }
    } else if (loggedIn == 1 && show404 == false) {
      switch (pageType) {
        case PageType.LOADING:
          stack = _loadingStack;
          break;
        case PageType.LANDING:
          stack = _landingStack;
          break;
        case PageType.REGISTER:
          stack = _registerStack;
          break;
        case PageType.LOGIN:
          stack = _loginStack;
          break;
        case PageType.RESETPW:
          stack = _resetPwStack;
          break;
        case PageType.POLLDETAIL:
          stack = _loginStack;
          break;
        case PageType.UNKNOWN:
          stack = _unknownStack;
          break;
        case PageType.POLLEXPLORE:
          stack = _exploreStack;
          break;
      }
    } else {
      stack = _unknownStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  List<Page> get _loadingStack => [LoadingPage()];
  List<Page> get _unknownStack => [ErrorPage()];
  List<Page> get _resetPwStack => [ForgotPasswordPage()];
  List<Page> get _loginStack => [LoginPage()];
  List<Page> get _pollDetailStack => [PollDetailPage()];
  List<Page> get _exploreStack => [ExplorePage()];
  List<Page> get _registerStack => [RegisterPage()];
  List<Page> get _landingStack => [LandingPage()];

  @override
  Future<void> setNewRoutePath(OHConfig configuration) async {
    if (configuration.unknown) {
      show404 = true;
      pageType = PageType.UNKNOWN;
    } else if (configuration.isRegisterPage) {
      show404 = false;
      pageType = PageType.REGISTER;
    } else if (configuration.isLostPasswordPage) {
      show404 = false;
      pageType = PageType.RESETPW;
    } else if (configuration.isLoginPage) {
      show404 = false;
      pageType = PageType.LOGIN;
    } else if (configuration.isLandingPage) {
      show404 = false;
      pageType = PageType.LANDING;
    } else if (configuration.isPollExplore) {
      show404 = false;
      pageType = PageType.POLLEXPLORE;
      urlCategory = configuration.pollCategory!;
    } else if (configuration.isPollDetail) {
      show404 = false;
      pageType = PageType.POLLDETAIL;
      pollCode = configuration.pollCode!;
    } else if (configuration.isLoadingPage) {
      show404 = false;
      pageType = PageType.LOADING;
    } else {
      show404 = true;
      pageType = PageType.UNKNOWN;
    }
  }

  _clear() async {
    // TOGO
  }
}
