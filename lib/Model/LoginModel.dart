/// token : "QpwL5tke4Pnpja7X4"

class LoginModel {
  LoginModel({
    String? token,
  }) {
    _token = token;
  }

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
  }

  String? _token;
  LoginModel copyWith({
    String? token,
  }) =>
      LoginModel(
        token: token ?? _token,
      );
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
