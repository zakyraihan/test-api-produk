import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_api_paihsan/data/model/model.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost:8080';

  Future getKategori() async {
    Uri urlData = Uri.parse('$_baseUrl/kategori/list');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
      String token = 'Bearer ${dataUser.data.accessToken}';

      final response = await http.get(
        urlData,
        headers: {"Authorization": token},
      );

      if (response.statusCode == 200) {
        Kategori kategoriRes = kategoriFromJson(response.body);
        return kategoriRes.data;
      } else {
        return null;
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future getProduk(String categoryId, String keywoard) async {
    Uri urlData = Uri.parse('$_baseUrl/produk/list?keyword=$keywoard');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
      String token = 'Bearer ${dataUser.data.accessToken}';

      final response = await http.get(
        urlData,
        headers: {"Authorization": token},
      );

      if (response.statusCode == 200) {
        Produk produkRes = produkFromJson(response.body);
        return produkRes.data;
      } else {
        return [];
      }
    } catch (e) {
      log('Error -> $e');
    }
  }
}
