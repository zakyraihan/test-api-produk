// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_api_paihsan/data/api/api_service.dart';
import 'package:test_api_paihsan/data/api/auth_service.dart';
import 'package:test_api_paihsan/data/model/model.dart';
import 'package:test_api_paihsan/widget/kategori_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController keywoard = TextEditingController();
  String categoryId = '';

  void searchProduct(String newText) {
    final query = newText.trim();
    if (query.isNotEmpty) {
      setState(() {
        ApiService().getProduk(categoryId, keywoard.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logOut(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: ApiService().getKategori(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<KategoriList> data = snapshot.data;

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10,
                          children: List.generate(
                            data.length,
                            (index) => KategoriWidget(
                              title: data[index].namaKategori,
                              onTap: () {
                                setState(() {
                                  categoryId = data[index].id.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Produk',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: keywoard,
                  onChanged: (value) {
                    searchProduct(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Cari produk...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: ApiService().getProduk(categoryId, keywoard.text),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<ProdukList> data = snapshot.data;

                      return SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          children: List.generate(
                            data.length,
                            (index) => GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/detailpage',
                                arguments: data[index],
                              ),
                              child: SizedBox(
                                width: 170,
                                child: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].namaProduk,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(data[index].deskripsiProduk),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Rp ${data[index].harga.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
