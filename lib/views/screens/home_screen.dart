import 'package:archive_app2/data/services/auth_service.dart';
import 'package:archive_app2/models/archive_model.dart';
import 'package:archive_app2/data/services/archive_service.dart';
import 'package:archive_app2/models/auth_model.dart';
import 'package:archive_app2/utils/app_pading.dart';
import 'package:archive_app2/viewModel/api_provider.dart';
import 'package:archive_app2/views/screens/login_screen.dart';
import 'package:archive_app2/views/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ArchiveService archiveService = ArchiveService();
  final TextEditingController searchController = TextEditingController();

  List<ArchiveModel> allArchiveList = [];
   User?user;

  bool isLoading = false;
  bool isLoadingMore = false;

  int currentPage = 1;
  final int pageSize = 50;

  final ScrollController _scrollController = ScrollController();

  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchArchives();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        fetchArchives(isLoadMore: true);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argum = ModalRoute.of(context)!.settings.arguments;
    if (argum != null && argum is User) {
      user = argum;
    } 
    
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchArchives({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      changeLoading();
    } else {
      setState(() {
        isLoadingMore = true;
      });
    }

    try {
      if (isLoadMore) {
        currentPage++;
      }

      final newArchives = await archiveService
          .fetchArchive(currentPage, pageSize, parsel: searchQuery);

      setState(() {
        if (!isLoadMore) {
          allArchiveList = newArchives;
        } else {
          allArchiveList.addAll(newArchives);
        }
      });
    } catch (e) {
      debugPrint('Hata oluştu: $e');
    }

    if (!isLoadMore) {
      changeLoading();
    } else {
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authViewModelProvider.notifier);
    const titleText = "Ana Sayfa";

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(titleText),
        actions: [
          Image.asset('assets/serdivanminilogo.png', width: 50, height: 50),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              
                Navigator.pushNamed(context, '/server');
              
              // Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/serdivan.png'),
              ),
              accountName: Text(user?.nameSurname ?? ""),
              accountEmail: Text(user?.email ?? ""),
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                await TokenManager.clearToken();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
                authNotifier.logout();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Ara (Parsel bilgisine göre arayınız)',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      searchQuery = value;
                      fetchArchives();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Detaylı Arama'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount:
                          allArchiveList.length + (isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == allArchiveList.length && isLoadingMore) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final archiveItem = allArchiveList[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomListTile(
                            folderNo: archiveItem.klasorNo ?? "",
                            folderDate: archiveItem.tarih ?? "",
                            islem: archiveItem.dosyaIslemNo ?? "",
                            foldermean: archiveItem.konum ?? "",
                            parsel: archiveItem.parsel ?? "",
                            icon: Icons.folder,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: archiveItem,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
