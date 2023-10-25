class PeriUser {
    int nFollowers;
    int active;
    int id;
    String name;
    String email;
    String password;
    String birthDate;
    String createdAt;

    PeriUser({
        required this.nFollowers,
        required this.active,
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.birthDate,
        required this.createdAt,
    });

    // fromjson method
    factory PeriUser.fromJson(Map<String, dynamic> json) => PeriUser(
        nFollowers: json["n_followers"],
        active: json["active"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        birthDate: json["birth_date"],
        createdAt: json["created_at"],
    );

}
