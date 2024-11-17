enum Routes {
  initial('initial', '/'),
  manage('manage', '/manage'),
  user('user', '/user');

  const Routes(this.name, this.path);
  final String name;
  final String path;
}
