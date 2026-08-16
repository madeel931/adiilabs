enum NewsletterStatus { initial, submitting, success, error }

class NewsletterState {
  final String email;
  final NewsletterStatus status;
  final String? errorMessage;

  const NewsletterState({
    this.email = '',
    this.status = NewsletterStatus.initial,
    this.errorMessage,
  });

  bool get isSubmitting => status == NewsletterStatus.submitting;
  bool get isSuccess => status == NewsletterStatus.success;

  NewsletterState copyWith({
    String? email,
    NewsletterStatus? status,
    String? errorMessage,
  }) {
    return NewsletterState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
