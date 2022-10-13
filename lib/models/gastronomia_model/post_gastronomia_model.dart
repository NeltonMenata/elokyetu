class PostGastronomiaModel {
  final String? postUserImgPerfil;
  final List<String>? postImg;
  final String? postUserName;
  final String? postContent;
  final DateTime? created;
  final int? typeFile;
  final int? likes;

  PostGastronomiaModel(
      {this.postUserImgPerfil,
      this.postImg,
      this.postUserName,
      this.created,
      this.typeFile,
      this.likes,
      this.postContent});

  void dateTime() {
    int? day = created?.day;

    if (day != null) {
      int dia = day;
    }
  }
}
