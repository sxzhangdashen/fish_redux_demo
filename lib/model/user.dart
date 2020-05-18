class User {
  User(
      {this.id,
      this.email,
      this.first_name,
      this.last_name,
      this.title,
      this.phone});
  User.fromJson(Map<String, Object> json) {
    id = json['id'];
    email = json['email'].toString();
    first_name = json['first_name'].toString();
    last_name = json['last_name'].toString();
    title = json['title'].toString();
    phone = json['phone'].toString();
  }
  int id;
  String email;
  String first_name;
  String last_name;
  String title;
  String phone;

  Map<String, Object> toJson() => <String, Object>{
        'id': id,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'title': title,
        'phone': phone,
      };
}
