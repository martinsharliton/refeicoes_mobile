class Env {
  static const Map<String, String> _keys = {'API_URL': String.fromEnvironment('API_URL')};

  static String _getKey(String key) {
    final value = _keys[key] ?? '';

    if (value.isEmpty) {
      throw Exception('$key não está nas variáveis de ambiente');
    }

    return value;
  }

  static String get apiURL => _getKey('API_URL');
}
