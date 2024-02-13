class AppEnv {
  static const env = String.fromEnvironment('ENV', defaultValue: 'Prod');
  static const apiUri = String.fromEnvironment('API_URI');
  static const captchaKey = String.fromEnvironment(
    'CAPTCHA_KEY',
    defaultValue: '6LcXZW8pAAAAAO86VB6l867QhKsBXjmxFwqMmXWN',
  );
  static const bool isDevEnv = env == 'Dev';
}
