enum PAGE {
  login(name: 'Login', path: '/login'),
  splash(name: 'Splash', path: '/splash'),
  home(name: 'Home', path: '/home');

  final String name;
  final String path;
  const PAGE({required this.name, required this.path});
}
