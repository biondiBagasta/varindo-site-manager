import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/carousel/marketplace_carousel.dart";
import "package:varindo_estate_management/components/others/adamulti/adamulti_menu_item_component.dart";
import "package:varindo_estate_management/components/others/adamulti/main_menu_shimmer.dart";
import "package:varindo_estate_management/components/others/marketplace/marketplace_product_card_component.dart";
import "package:varindo_estate_management/components/others/marketplace/marketplace_shop_card_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/cubit/server_cubit.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/model/adamulti/kategori_with_menu_response.dart";
import "package:varindo_estate_management/services/adamulti_service.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MarketplaceMainTab extends StatefulWidget {

  const MarketplaceMainTab({ super.key });

  @override
  State<MarketplaceMainTab> createState() => _MarketplaceMainTabState();
}

class _MarketplaceMainTabState extends State<MarketplaceMainTab> {
  final List<Map<String, dynamic>> makananList = [
    {
      "name": "Mie Setan Pedas 2 Mie Setan Pedas 2", 
      "image": "https://awsimages.detik.net.id/community/media/visual/2023/10/05/mie-gacoan_11.png?w=600&q=90", 
      "shopName": "Mie Gacoan", 
      "price": 25000, 
      "onTap": () {}
    },
    {
      "name": "Mixue", 
      "image": "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e97f68d3-38cd-48a3-bc7a-bdcd573964a8_yaahRJQK-fZTTQFpG-cJxTeHPC.png", 
      "shopName": "Mixue Cream Tea", 
      "price": 15000, 
      "onTap": () {}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarketplaceCarousel(),
          SizedBox(height: 24,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTextComponent(text: "Toko Terdekat", fontSize: 16, fontWeight: FontWeight.w600),
              MainTextColorComponent(
                text: "Lihat Semua", 
                fontSize: 14, 
                fontWeight: FontWeight.w600, 
                color: HexColor.fromHex(kSecondaryColor)
              ),
            ],
          ),
          SizedBox(height: 18,),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MarketplaceShopCardComponent(
                  shopName: "Mie Gacoan", 
                  image: "https://upload.wikimedia.org/wikipedia/id/5/5c/LogoMieGacoan.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
                MarketplaceShopCardComponent(
                  shopName: "MCD", 
                  image: "https://upload.wikimedia.org/wikipedia/commons/3/32/McDonald%27s_1968_logo.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
                MarketplaceShopCardComponent(
                  shopName: "Mixue", 
                  image: "https://www.dayaauto.co.id/wp-content/uploads/2025/11/mixue-logo-png_seeklogo-469135.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
                MarketplaceShopCardComponent(
                  shopName: "Mie Gacoan", 
                  image: "https://upload.wikimedia.org/wikipedia/id/5/5c/LogoMieGacoan.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
                MarketplaceShopCardComponent(
                  shopName: "MCD", 
                  image: "https://upload.wikimedia.org/wikipedia/commons/3/32/McDonald%27s_1968_logo.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
                MarketplaceShopCardComponent(
                  shopName: "Mixue", 
                  image: "https://www.dayaauto.co.id/wp-content/uploads/2025/11/mixue-logo-png_seeklogo-469135.png", 
                  onTap: () {
              
                  }, 
                  rating: 5, 
                  ratingCount: 1000
                ),
                SizedBox(width: 12,),
              ],
            ),
          ),
          SizedBox(height: 24,),
          MainTextComponent(text: "Produk Unggulan", fontSize: 16, fontWeight: FontWeight.w600),
          SizedBox(height: 18,),
          GridView.builder(
            itemCount: makananList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
      
              // tinggi fix
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              return MarketplaceProductCardComponent(
                name: makananList[index]["name"], 
                image: makananList[index]["image"], 
                shopName: makananList[index]["shopName"], 
                price: makananList[index]["price"], 
                onTap: () {
      
                }
              );
            },
          ),
          SizedBox(height: 24,),
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider("https://i.ytimg.com/vi/aPkVIZjBr3M/maxresdefault.jpg")
                    )
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainTextComponent(text: "Nasi Kotaraja", fontSize: 16, fontWeight: FontWeight.w600),
                      SizedBox(height: 4,),
                      MainTextComponent(text: "Nasi Kotaraja Lotim", fontSize: 14, fontWeight: FontWeight.w400),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainTextColorComponent(
                            text: FormatCurrency.convertToIdr(15000, 0), 
                            fontSize: 16, 
                            fontWeight: FontWeight.w600, 
                            color: HexColor.fromHex(kPrimaryColor)
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: HexColor.fromHex(kPrimaryColor),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Icon(Icons.add_shopping_cart, color: Colors.white,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24,),
          MainTextComponent(text: "Pulsa dan Tagihan (PPOB)", fontSize: 16, fontWeight: FontWeight.w600),
          SizedBox(height: 18,),
          Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              child: SizedBox(
                width: constantScreenWidth,
                child: FutureBuilder<KategoriWithMenuResponse>(
                  future: locator.get<AdamultiService>().getFavoriteMenu(appVersionName), 
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Wrap(
                        alignment: WrapAlignment.start,
                        spacing: constantScreenWidth * 0.01,
                        runSpacing: 12,
                        children: [
                          for(var i = 0; i < (snapshot.data!.menulist ?? []).length; i++) AdamultiMenuItemComponent(
                            mainContainerWidth: constantScreenWidth * 0.16,
                            containerWidth: constantScreenWidth * 0.14,
                            containerHeight: constantScreenWidth * 0.14,
                            imageWidth: constantScreenWidth * 0.1,
                            imageHeight: constantScreenWidth * 0.1,
                            imageUrl: "${locator.get<ServerCubit>().state.baseUrlAuth}/files/menu-mobile/image/${snapshot.data!.menulist![i].icon!}", 
                            label: snapshot.data!.menulist![i].name ?? "", 
                            onTapAction: () {
                            }, 
                            menuColor: HexColor.fromHex(snapshot.data!.menulist?[i].containercolor ?? kPrimaryColor),
                            containerBorderRadius: 12,
                          )
                        ],
                      );
                    } else {
                      return MainMenuShimmer(dataLength: 10);
                    }
                  }
                ),
              ),
            )
          ),
          SizedBox(height: 64,)
        ],
      ),
    );
  }
}