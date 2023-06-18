import 'package:movie_player/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
  RecommendationModel({
  super.backdropPath,
  required super.id
  });

  factory RecommendationModel.fromJson(Map<String,dynamic> json) =>
  RecommendationModel(
   backdropPath: json['backdrop_path'] ??'https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg',
   id: json['id']
);
}