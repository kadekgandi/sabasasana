class Place {
  int? id;
  String nama;
  String kategori;
  String body;
  String url;

  Place({this.id, required this.nama, required this.kategori, required this.body, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'body': body,
      'url': url,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      nama: map['nama'],
      kategori: map['kategori'],
      body: map['body'],
      url: map['url'],
    );
  }
}
