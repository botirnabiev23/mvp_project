enum AppRoutes {
  home('home', '/home'),
  favourite('favourite', '/favourite');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
