import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_post_repository_imp.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostsRepositoryImplementation videoPostsRepository;

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async {
    final newVideos = await videoPostsRepository.getTrendingVideoByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
