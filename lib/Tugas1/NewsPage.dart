import 'package:flutter/material.dart';
import 'package:bali_app/services/data_services.dart';
import 'package:bali_app/dto/news.dart';

class NewsPage extends StatefulWidget {
   @override
  _NewsPage createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage>{
  late Future<List<News>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsApi.fetchNews();
  }



  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Page'),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNews(context),
        child: Icon(Icons.add),
      ),
        body: FutureBuilder(
        future: _newsFuture,
        builder: (context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final newsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return ListTile(
                  title: Text(news.title),
                  onTap: () => _showNewsDetail(context, news),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editNews(context, news),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteNews(context, news),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }


void _showNewsDetail(BuildContext context, News news) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(news.title),
          content: Text(news.body),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _editNews(BuildContext context, News news) async {
    final TextEditingController _titleController =
        TextEditingController(text: news.title);
    final TextEditingController _bodyController =
        TextEditingController(text: news.body);

    final updatedNews = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit News'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Body'),
              ),
            ],
          ),
          actions: [
            // cancel
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            // save
            TextButton(
            onPressed: () async {
                final String newTitle = _titleController.text;
                final String newBody = _bodyController.text;
                
                final updatedNews =
                    news.copyWith(title: newTitle, body: newBody);
         
                try {
                  await NewsApi.editNews(updatedNews);
                  Navigator.pop(context, updatedNews);
                  // Perbarui state jika diperlukan
                       
                  setState(() {
                    _newsFuture = NewsApi.fetchNews();
                  });
                } catch (e) {
                  print('Failed to edit news: $e');
                  // Tampilkan pesan kesalahan jika gagal mengedit
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to edit news'),
                  ));
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (updatedNews != null) {
      // Panggil fungsi untuk menyimpan perubahan ke API atau ke penyimpanan lokal
      print('Updated news: $updatedNews');
      // Selanjutnya, Anda dapat memperbarui daftar berita atau melakukan tindakan lainnya.
    }
  }

  void _deleteNews(BuildContext context, News news) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete News'),
          content: Text('Are you sure you want to delete "${news.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                NewsApi.deleteNews(news.id).then((_) {
                  setState(() {
                    // Set ulang future untuk merefresh data dari API setelah penghapusan
                    _newsFuture = NewsApi.fetchNews();
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

   void _addNews(BuildContext context) async {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _bodyController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add News'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Body'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final String title = _titleController.text;
                final String body = _bodyController.text;
              // memanggil api untuk mnmbhkn
                try {
                  await NewsApi.addNews(title, body);
                  Navigator.pop(context);
                  // Refresh list after adding news
                  setState(() {
                    _newsFuture = NewsApi.fetchNews();
                  });
                } catch (e) {
                  print('Failed to add news: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to add news'),
                    ),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

}
