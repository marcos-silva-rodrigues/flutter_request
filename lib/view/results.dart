import 'package:flutter/material.dart';
import 'package:untitled1/model/github_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ResultsScreen extends StatelessWidget {
  final String username;

  const ResultsScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Resultados"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder(
          future: _fecthGithubProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final profile = snapshot.data as GithubProfile;
              print(profile);
              return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(profile.avatar_url),
                    ),
                    Container(height: 10.0),
                    Text(
                      profile.login,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(height: 10.0),
                    Text(
                      profile.blog,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Seguidores: ${profile.followers}",
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        Container(width: 20.0),
                        Container(
                          child: Text(
                            "Repositorios: ${profile.public_repos}",
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Erro ${snapshot.error}");
            }

            return CircularProgressIndicator(
              backgroundColor: Colors.black,
            );
          },
        ),
      ),
    );
  }

  Future<GithubProfile> _fecthGithubProfile() async {
    var url = Uri.https("api.github.com", "/users/$username");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return GithubProfile.fromJson(jsonResponse);
    } else {
      throw new Exception(
          'Request failed with status: ${response.statusCode}.');
    }
  }
}
