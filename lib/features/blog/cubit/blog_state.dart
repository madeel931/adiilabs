import '../models/article_model.dart';

class BlogState {
  final List<ArticleModel> articles;
  final String? selectedCategory;
  final ArticleModel? activeArticle;

  const BlogState({
    required this.articles,
    this.selectedCategory,
    this.activeArticle,
  });

  List<ArticleModel> get filteredArticles {
    if (selectedCategory == null || selectedCategory!.isEmpty) {
      return articles;
    }
    return articles.where((a) => a.category == selectedCategory).toList();
  }

  BlogState copyWith({
    List<ArticleModel>? articles,
    String? selectedCategory,
    ArticleModel? activeArticle,
    bool clearActiveArticle = false,
  }) {
    return BlogState(
      articles: articles ?? this.articles,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      activeArticle: clearActiveArticle
          ? null
          : (activeArticle ?? this.activeArticle),
    );
  }
}
