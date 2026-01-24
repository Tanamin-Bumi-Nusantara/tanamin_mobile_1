import '../../domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  const ArticleRepositoryImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }
}
