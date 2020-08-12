class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "Endereço de e-mail existente.",
    "OPERATION_NOT_ALLOWED": "Operação não permitida.",
    "TOO_MANY_ATTEMPTS_TRY_LATER": "Várias tentativas. Tente mais tarde.",
    "EMAIL_NOT_FOUND": "Não há registro com este e-mail",
    "INVALID_PASSWORD": "A senha é inválida.",
    "USER_DISABLED": "A conta foi inativada por um administrador.",
  };
  final String key;

  AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return "Ocorreu um erro de autenticação";
    }
  }
}
