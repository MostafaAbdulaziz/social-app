class SocialUserModel{
  String? name;
  String? email;
  String? phone;
  String? uid;

  SocialUserModel({
    this.email,
    this.phone,
    this.name,
    this.uid
});

  SocialUserModel.fromJson(Map<String,dynamic> json){
    email=json['email'];
    phone=json['phone'];
    name=json['name'];
    uid=json['uid'];
  }

  Map<String ,dynamic> toMap() {
    return{
    'email':email,
    'phone':phone,
    'name':name,
    'uid':uid,
    };
  }
}