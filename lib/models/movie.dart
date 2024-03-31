

class Movie{

 final String title;
 final String backDropPath;
 final String originalTitle;
 final String overView;
 final String posterPath;
 final String releaseDate;
 final double voteAvarage;

 Movie({
   required this.title,
   required this.backDropPath,
   required this.originalTitle,
   required this.overView,
   required this.posterPath,
   required this.releaseDate,
   required this.voteAvarage});


factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overView: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        voteAvarage: json["vote_average"]);
  }
  // Map<String,dynamic> toJson(){
  // return {
  //   "title":title,
  //   "backdrop_path": backDropPath,
  // };
  //
  // }
}