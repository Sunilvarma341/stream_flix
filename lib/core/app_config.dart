class AppConfig {
  static const String env = String.fromEnvironment("app", defaultValue: "dev");
  static const String fireBaseClientId = String.fromEnvironment(
    "fireBaseClientId",
  );
}
