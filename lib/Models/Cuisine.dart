// To parse this JSON data, do
//
//     final cuisine = cuisineFromJson(jsonString);

import 'dart:convert';

Cuisine cuisineFromJson(String str) => Cuisine.fromJson(json.decode(str));

String cuisineToJson(Cuisine data) => json.encode(data.toJson());

class Cuisine {
  Cuisine({
    required this.sorting,
    required this.filterMapping,
    required this.filterOptions,
    required this.activeFilterOptions,
    required this.query,
    required this.totalResults,
    required this.limit,
    required this.offset,
    required this.searchResults,
    required this.expires,
  });

  String sorting;
  FilterMapping filterMapping;
  List<dynamic> filterOptions;
  List<dynamic> activeFilterOptions;
  String query;
  int totalResults;
  int limit;
  int offset;
  List<SearchResult> searchResults;
  int expires;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
    sorting: json["sorting"],
    filterMapping: FilterMapping.fromJson(json["filterMapping"]),
    filterOptions: List<dynamic>.from(json["filterOptions"].map((x) => x)),
    activeFilterOptions: List<dynamic>.from(json["activeFilterOptions"].map((x) => x)),
    query: json["query"],
    totalResults: json["totalResults"],
    limit: json["limit"],
    offset: json["offset"],
    searchResults: List<SearchResult>.from(json["searchResults"].map((x) => SearchResult.fromJson(x))),
    expires: json["expires"],
  );

  Map<String, dynamic> toJson() => {
    "sorting": sorting,
    "filterMapping": filterMapping.toJson(),
    "filterOptions": List<dynamic>.from(filterOptions.map((x) => x)),
    "activeFilterOptions": List<dynamic>.from(activeFilterOptions.map((x) => x)),
    "query": query,
    "totalResults": totalResults,
    "limit": limit,
    "offset": offset,
    "searchResults": List<dynamic>.from(searchResults.map((x) => x.toJson())),
    "expires": expires,
  };
}

class FilterMapping {
  FilterMapping();

  factory FilterMapping.fromJson(Map<String, dynamic> json) => FilterMapping(
  );

  Map<String, dynamic> toJson() => {
  };
}

class SearchResult {
  SearchResult({
    required this.name,
    required this.type,
    required this.totalResults,
    required this.totalResultsVariants,
    required this.results,
  });

  String name;
  String type;
  int totalResults;
  int totalResultsVariants;
  List<Result> results;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    name: json["name"],
    type: json["type"],
    totalResults: json["totalResults"],
    totalResultsVariants: json["totalResultsVariants"] == null ? null : json["totalResultsVariants"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "totalResults": totalResults,
    "totalResultsVariants": totalResultsVariants == null ? null : totalResultsVariants,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
    required this.type,
    required this.relevance,
    required this.content,
    required this.dataPoints,
  });

  int id;
  String name;
  String image;
  String link;
  Type type;
  double relevance;
  String content;
  List<dynamic> dataPoints;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
    image: json["image"] == null ? null : json["image"],
    link: json["link"] == null ? null : json["link"],
    type: typeValues.map[json["type"]]!,
    relevance: json["relevance"].toDouble(),
    content: json["content"] == null ? null : json["content"],
    dataPoints: List<dynamic>.from(json["dataPoints"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
    "image": image == null ? null : image,
    "link": link == null ? null : link,
    "type": typeValues.reverse[type],
    "relevance": relevance,
    "content": content == null ? null : content,
    "dataPoints": dataPoints == null ? null : List<dynamic>.from(dataPoints.map((x) => x)),
  };
}

enum Type { HTML, YOUTUBE_VIDEO }

final typeValues = EnumValues({
  "HTML": Type.HTML,
  "YOUTUBE_VIDEO": Type.YOUTUBE_VIDEO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
