const String LOADING = 'loading';
const String REGISTER = 'register';
const String LOGIN = 'login';
const String RESETPW = 'passwordreset';
const String LANDING = 'landing';
const String POLLEXPLORE = 'polls';
const String POLLDETAIL = 'poll';
const String UNKNOWN = 'unknown';

enum PageType {
  LOADING,
  REGISTER,
  LOGIN,
  RESETPW,
  LANDING,
  POLLEXPLORE,
  POLLDETAIL,
  UNKNOWN,
}

class OHConfig {
  final PageType page;
  final String? pollCode;
  final String? pollCategory;
  final bool unknown;
  final int loggedIn;

  OHConfig.loading()
      : page = PageType.LOADING,
        pollCode = null,
        pollCategory = null,
        unknown = false,
        loggedIn = 0;

  OHConfig.error()
      : page = PageType.UNKNOWN,
        pollCode = null,
        pollCategory = null,
        unknown = true,
        loggedIn = 1;

  OHConfig.register()
      : page = PageType.REGISTER,
        pollCode = null,
        pollCategory = null,
        unknown = false,
        loggedIn = 1;

  OHConfig.login()
      : page = PageType.LOGIN,
        pollCode = null,
        pollCategory = null,
        unknown = false,
        loggedIn = 1;

  OHConfig.resetPassword()
      : page = PageType.RESETPW,
        pollCode = null,
        pollCategory = null,
        unknown = false,
        loggedIn = 1;

  OHConfig.landing()
      : page = PageType.LANDING,
        pollCode = null,
        pollCategory = null,
        unknown = false,
        loggedIn = 1;
  
  OHConfig.pollExplore(String _pollCategory)
  : page = PageType.POLLEXPLORE,
  pollCode = null,
  pollCategory = _pollCategory,
  unknown = false,
  loggedIn = 1;

  OHConfig.pollDetail(String _pollCode)
      : page = PageType.POLLDETAIL,
        pollCode = _pollCode,
        pollCategory = null,
        unknown = false,
        loggedIn = 2;

  bool get isLoadingPage =>
      page == PageType.LOADING && unknown == false && loggedIn == 0 && pollCategory == null && pollCode == null;
  bool get isUnknownPage => page == PageType.UNKNOWN && unknown == true && pollCategory == null &&
      pollCode == null;
  bool get isRegisterPage =>
      page == PageType.REGISTER && unknown == false && loggedIn == 1 && pollCategory == null &&
      pollCode == null;
  bool get isLoginPage =>
      page == PageType.LOGIN && unknown == false && loggedIn == 1 && pollCategory == null &&
      pollCode == null;
  bool get isLostPasswordPage =>
      page == PageType.RESETPW && unknown == false && loggedIn == 1 && pollCategory == null &&
      pollCode == null;
  bool get isLandingPage => page == PageType.LANDING && unknown == false && pollCategory == null &&
      pollCode == null;
  bool get isPollExplore => page == PageType.POLLDETAIL && unknown == false && pollCategory != null &&
      pollCode == null;
  bool get isPollDetail =>
      page == PageType.POLLDETAIL &&
      unknown == false &&
      loggedIn == 2 &&
      pollCode != null && pollCategory == null;
}
