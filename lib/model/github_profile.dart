class GithubProfile {
  final String name;
  final String login;
  final String avatar_url;
  final String blog;
  final int followers;
  final int public_repos;

  const GithubProfile(
      {required this.name,
        required this.login,
      required this.avatar_url,
      required this.blog,
      required this.followers,
      required this.public_repos});

  factory GithubProfile.fromJson(Map<String, dynamic> json) {
    return GithubProfile(
      name: json["name"],
      login: json["login"],
      avatar_url: json["avatar_url"],
      blog: json["blog"],
      followers: json["followers"],
      public_repos: json["public_repos"],
    );
  }
}
