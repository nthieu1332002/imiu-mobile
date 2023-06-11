class Welcome {
  final String image;
  final String content;

  Welcome({
    required this.image,
    required this.content,
  });
}

final welcomeList = [
  Welcome(
    image: 'assets/images/imiu-login.png',
    content: 'Imiu đồng hành cùng bạn trong mỗi bữa ăn',
  ),
  Welcome(
    image: 'assets/images/imiu-get-started-2.png',
    content: 'Thực đơn của người Việt, cho người Việt',
  ),
  Welcome(
    image: 'assets/images/imiu-get-started-3.png',
    content: 'Lên thực đơn dinh dưỡng của bạn ngay nào',
  ),
];
