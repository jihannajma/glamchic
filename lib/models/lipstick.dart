class Lipstick {
  List<Data>? data;

  Lipstick({this.data});

  Lipstick.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  String? deskripsi;
  int? harga;
  String? gambar;
  String? kategori;

  Data(
      {this.id,
      this.nama,
      this.deskripsi,
      this.harga,
      this.gambar,
      this.kategori});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    gambar = json['gambar'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['deskripsi'] = this.deskripsi;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    data['kategori'] = this.kategori;
    return data;
  }
}
