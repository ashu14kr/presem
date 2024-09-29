class SongModel {
  int? songid;
  String? songname;
  String? userid;
  String? trackid;
  Durationr? duration;
  String? coverImageUrl;

  SongModel({
    this.songid,
    this.songname,
    this.userid,
    this.trackid,
    this.duration,
    this.coverImageUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        songid: json["songid"],
        songname: json["songname"],
        userid: json["userid"],
        trackid: json["trackid"],
        duration: Durationr.fromJson(json["duration"]),
        coverImageUrl: json["cover_image_url"],
      );

  Map<String, dynamic> toJson() => {
        'songid': songid,
        'songname': songname,
        'userid': userid,
        'trackid': trackid,
        'duration': duration,
        'cover_image_url': coverImageUrl,
      };
}

class Durationr {
  int? hours;
  int? minutes;
  int? seconds;

  Durationr({
    required this.hours,
    required this.minutes,
    int? seconds,
  });

  factory Durationr.fromJson(Map<String, dynamic> json) => Durationr(
        hours: json["hours"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "minutes": minutes,
      };
}
