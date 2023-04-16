class Songs {
  String? id;
  String? songName;
  String? artistName;
  String? albumName;
  int? songLength;
  String? songReleaseDate;
  String? songLyrics;
  String? songurl;
  String? songImage;
  Null? songGenre;

  Songs(
      {this.id,
        this.songName,
        this.artistName,
        this.albumName,
        this.songLength,
        this.songReleaseDate,
        this.songLyrics,
        this.songurl,
        this.songImage,
        this.songGenre});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    songName = json['songName'];
    artistName = json['artistName'];
    albumName = json['albumName'];
    songLength = json['songLength'];
    songReleaseDate = json['songReleaseDate'];
    songLyrics = json['songLyrics'];
    songurl = json['songurl'];
    songImage = json['songImage'];
    songGenre = json['songGenre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['songName'] = this.songName;
    data['artistName'] = this.artistName;
    data['albumName'] = this.albumName;
    data['songLength'] = this.songLength;
    data['songReleaseDate'] = this.songReleaseDate;
    data['songLyrics'] = this.songLyrics;
    data['songurl'] = this.songurl;
    data['songImage'] = this.songImage;
    data['songGenre'] = this.songGenre;
    return data;
  }
}