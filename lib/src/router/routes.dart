enum Routes {
  initial('initial', '/'),
  home('home', '/home'),
  bookings('bookings', '/bookings'),
  manage('manage', '/manage'),
  profile('profile', '/profile'),
  user('user', '/user'),
  company('company', '/company');

  const Routes(this.name, this.path);
  final String name;
  final String path;
}
