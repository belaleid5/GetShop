
class FaceBookModel
{
  final String ? name;
  final String ? email;
  final int ? id;
  final  FaceBookPhotoModel ? faceBookPhotoModel;

  FaceBookModel({this.name, this.email, this.id, this.faceBookPhotoModel});

  factory FaceBookModel.fromJson(Map<String,dynamic>json)=>
      FaceBookModel(
        name: json['name'],
        email: json['email'],
        id: json['id'],
        faceBookPhotoModel: FaceBookPhotoModel.fromJson(json['picture'] ['data']),
      );



}

class FaceBookPhotoModel {
  final String ? url;
  final int ? height;
  final int ? width;

  FaceBookPhotoModel({this.url, this.height, this.width,});
  factory FaceBookPhotoModel.fromJson(Map<String,dynamic>json)=>
      FaceBookPhotoModel(
          url:json['url'],
          height:json['height'],
          width:json['width']);




}