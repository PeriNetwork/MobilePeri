class Post {
    final int id;
    final String title;
    final String description;
    final DateTime createdAt;
    final int active;
    final int idPeriUser;

    Post({
        required this.id,
        required this.title,
        required this.description,
        required this.createdAt,
        required this.active,
        required this.idPeriUser,
    });
}
