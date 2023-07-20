class LoginRequest{


  String? name;
  String? phone;

  LoginRequest({ this. name, this.phone});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;

    return data;
  }
}
