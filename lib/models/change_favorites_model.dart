class ChangeFavotitesModel {
  bool? status;
  String? message;

  ChangeFavotitesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
