class ApiConstants {
  ApiConstants._cons();
  static ApiConstants? _ins;
  static ApiConstants get instance => _ins ??= ApiConstants._cons();

  String baseurl = 'https://jsonplaceholder.typicode.com/';

  String users = 'users';
  String posts = 'posts';
  String photos = 'photos';
  String todos = 'todos';
}
