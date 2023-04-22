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
  Null songGenre;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['songName'] = songName;
    data['artistName'] = artistName;
    data['albumName'] = albumName;
    data['songLength'] = songLength;
    data['songReleaseDate'] = songReleaseDate;
    data['songLyrics'] = songLyrics;
    data['songurl'] =songurl;
    data['songImage'] = songImage;
    data['songGenre'] = songGenre;
    return data;
  }
}