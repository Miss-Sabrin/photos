class PhotosModel {
  int? albumbId;
  int? id;
  String? title;
  String? url;
  String? thumnailUrl;

  PhotosModel({this.id, this.albumbId, this.title, this.thumnailUrl, this.url});

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
        albumbId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumnailUrl: json['thumbnailUrl']);
  }
}



















// class Photos{
//   int? albumid;
//   int? id;
//   String? title;
//   String? url;
//   String? thumnailurl;

//   Photos({this.albumid,this.id,this.title,this.url,this.thumnailurl});

//   factory Photos.formJson(Map<String,dynamic>json){
//     return Photos(
//       albumid: json["albumId"],
//       id: json["id"],
//       title: json["title"],
//       url: json["url"], 
//       thumnailurl: json["thumbnailUrl"]

//     );

//   }

// }