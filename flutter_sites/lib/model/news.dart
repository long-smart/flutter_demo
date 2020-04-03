class NewsItemModal {
  String author; // 产品描述
  String title; // 产品类型
  String content; // 产品名字

  NewsItemModal({
    this.author,
    this.title,
    this.content,
  });

  factory NewsItemModal.fromJson(dynamic json) {
    return NewsItemModal(
      author: json['author'],
      title: json['title'],
      content: json['content'],
    );
  }
}

class NewsListModal {
  List<NewsItemModal> data;
  NewsListModal(this.data);

  factory NewsListModal.fromJson(List json) {
    return NewsListModal(
      json.map((i) => NewsItemModal.fromJson(i)).toList()
    );
  }
}
