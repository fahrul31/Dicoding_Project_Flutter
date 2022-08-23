import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masakan Terbaik",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff367668),
                    ),
                  ),
                  Text(
                    "Untuk Anda",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //search input
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color(0xfff3f3f4),
                  borderRadius: BorderRadius.circular(18)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Cari...",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            //promo banner
            Container(
              margin: const EdgeInsets.only(left: 18, top: 15, bottom: 18),
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => banner(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 2),
            ),

            //tabbar
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey[300]),
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                unselectedLabelColor: Colors.black54,
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff367668),
                ),
                tabs: List.generate(
                  4,
                  (index) => const Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Data",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //list menu
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(
                  4,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/detail-page");
                    },
                    child: listMenu(context),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding listMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (context, index) => menu(context),
      ),
    );
  }

  SizedBox menu(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //picture
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/xnurgo60mme1ewupfbin.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //desc
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Rp. 50000",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox banner() {
    return SizedBox(
      width: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(
          "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/xnurgo60mme1ewupfbin.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
