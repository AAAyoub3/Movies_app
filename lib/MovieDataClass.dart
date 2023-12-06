class Movie{
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Movie.fromFireStore(Map<String,dynamic> data):this(
      adult: data['adult'],
      backdropPath : data['backdropPath'],
      genreIds : data['genreIds'] != null ? data['genreIds'].cast<num>() : [],
      id : data['id'],
      originalLanguage : data['originalLanguage'],
      originalTitle : data['originalTitle'],
      overview : data['overview'],
      popularity : data['popularity'],
      posterPath : data['posterPath'],
      releaseDate : data['releaseDate'],
      title : data['title'],
      video : data['video'],
      voteAverage : data['voteAverage'],
      voteCount : data['voteCount'],
  );

  Map<String,dynamic> toFireStore(){
    return{
      "adult": adult,
      "backdropPath" : backdropPath,
      "genreIds" : genreIds,
      "id" : id,
      "originalLanguage" : originalLanguage,
      "originalTitle" : originalTitle,
      "overview" : overview,
      "popularity" : popularity,
      "posterPath" : posterPath,
      "releaseDate" : releaseDate,
      "title" : title,
      "video" : video,
      "voteAverage" : voteAverage,
      "voteCount" : voteCount,
    };
  }
}
