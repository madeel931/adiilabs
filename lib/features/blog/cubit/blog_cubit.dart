import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/article_model.dart';
import 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(const BlogState(articles: ArticlesData.allArticles));

  void selectCategory(String? category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void openArticle(ArticleModel article) {
    emit(state.copyWith(activeArticle: article));
  }

  void openArticleById(String id) {
    final article = state.articles.firstWhere(
      (a) => a.id == id,
      orElse: () => state.articles.first,
    );
    emit(state.copyWith(activeArticle: article));
  }

  void closeArticle() {
    emit(state.copyWith(clearActiveArticle: true));
  }
}
