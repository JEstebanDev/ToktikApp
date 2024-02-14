import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImplementation implements VideoPostRepository {
  final VideoPostDataSource videosDataSource;

  VideoPostsRepositoryImplementation({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) {
    return videosDataSource.getTrendingVideoByPage(page);
  }

}