import 'package:flutter/material.dart';
import 'package:tugasapi/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final ApiService _apiService = ApiService();
  List<dynamic>? cryptoData;
  String searchQuery = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCryptoData();
  }

  Future<void> fetchCryptoData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await _apiService.fetchCryptos();
      setState(() {
        cryptoData = data;
      });
    } catch (e) {
      showErrorDialog(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCryptos = cryptoData == null
        ? []
        : cryptoData!.where((crypto) {
      return crypto['name']
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("List Crypto"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => setState(() => searchQuery = query),
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : (filteredCryptos.isEmpty
                ? Center(child: Text('Tidak ada data yang tersedia'))
                : ListView.builder(
              itemCount: filteredCryptos.length,
              itemBuilder: (context, index) {
                final crypto = filteredCryptos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      crypto['image'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(crypto['name']),
                    subtitle: Text('Price: \$${crypto['current_price']}'),
                  ),
                );
              },
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchCryptoData,
        child: Icon(Icons.refresh),
        tooltip: 'Refresh Data',
      ),
    );
  }
}
