import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/screens/product_detail_screen/product_details_screen.dart';

class ReadProducts extends StatelessWidget {
  const ReadProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Shopp").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: ((context) {
                          return ProductDetails(x);
                        })),
                      );
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: x['Image'],
                            ),
                          ),
                          // Expanded(
                          //   child: Image(
                          //     image: NetworkImage(x["Image"]),
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                x["Name"],
                              ),
                              Text(
                                x["Price"],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                x["Description"],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return const StaggeredTile.fit(1);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
