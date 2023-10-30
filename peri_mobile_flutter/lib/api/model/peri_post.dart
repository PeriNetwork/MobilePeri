class Post {
    final int id;
    final String title;
    final String description;
    final DateTime createdAt;
    final int active;
    final int idPeriUser;
    final String author;
    int numLikes;
    List<String> comments;
    bool liked;

    Post({
        required this.id,
        required this.title,
        required this.description,
        required this.createdAt,
        required this.active,
        required this.idPeriUser,
        required this.author,
        required this.numLikes,
        required this.comments,
        required this.liked,
    });
}
