class EventImage {
  String? id;
  String? base64;
  String? url;
  String? tipo;

  EventImage({this.id, this.base64, this.url, this.tipo});

  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    base64 = json['base64'];
    url = json['url'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base64'] = base64;
    data['url'] = url;
    data['tipo'] = tipo;
    return data;
  }
}