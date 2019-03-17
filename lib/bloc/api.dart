import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GithubApi {
  final String baseUrl = "https://api.github.com/search/repositories?q=";
  final Map<String, SearchResult> cache = <String, SearchResult>{};
  final http.Client client = http.Client();

  Future<SearchResult> search(String term) async {
    if (cache.containsKey(term)) {
      return cache[term];
    } else {
      final result = await _fetchResults(term);

      cache[term] = result;

      return result;
    }
  }

  Future<SearchResult> _fetchResults(String term) async {
    final res = await client.get(Uri.parse("$baseUrl$term"));
    final results = json.decode(res.body);

    if (res.statusCode == 200) {
      return SearchResult.fromJson(results["items"]);
    } else {
      throw SearchError("Error ${res.statusCode}");
    }
  }
}

class SearchError {
  final String message;

  SearchError(this.message);
}

class SearchResult {
  final List<SearchResultItem> items;

  SearchResult(this.items);

  factory SearchResult.fromJson(dynamic json) {
    final items = (json as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> item) {
      return SearchResultItem.fromJson(item);
    }).toList();

    return SearchResult(items);
  }

  bool get isPopulated => items.isNotEmpty;

  bool get isEmpty => items.isEmpty;
}

class SearchResultItem {
  final String fullName;
  final String url;
  final String avatarUrl;
  final int stars;
  final int forks;
  final String name;
  final String language;
  final String description;

  SearchResultItem(this.fullName, this.url, this.avatarUrl, this.name, this.stars, this.forks, this.language, this.description);

  factory SearchResultItem.fromJson(Map<String, Object> json) {
    return SearchResultItem(
      json["full_name"] as String,
      json["html_url"] as String,
      (json["owner"] as Map<String, Object>)["avatar_url"] as String,
      json["name"] as String,
      json["stargazers_count"] as int,
      json["forks_count"] as int,
      json["language"] as String,
      json["description"] as String
    );
  }
}