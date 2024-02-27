class NetworkStrings {
  static const String baseUrl = 'http://34.203.248.123:5000';

  static const String registerPath = '$baseUrl/api/v1/auth/register';
  static const String loginPath = '$baseUrl/api/v1/auth/login';
  static const String refreshTokenPath = '$baseUrl/api/v1/auth/token/refresh';
  static const String categoriesPath = '$baseUrl/api/v1/categories';
  static const String bookmarksPath = '$baseUrl/api/v1/bookmarks';

// static String parentChildHomeworkPath(int index) => "$baseUrl/en/api/get-student-homework-parent/$index/";


}