import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset("assets/logo/img.png"),
            SizedBox(width: 11,),
            Text("Monety")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.search),
          ),

          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/logo/img_2.png"),
                    Column(
                      children: [
                        Text("data", style: TextStyle(fontSize: 25, color: Colors.grey,)),
                        Text("data", style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color(0XFF6674d4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Expense Total",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),
                        ),
                        Text(
                            "\$3,734",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 66
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0XFFd96664),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Center(
                                  child: Text(
                                      "+\$240",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(width: 11,),
                            Text(
                                "then last month",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Expense List",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 1,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Tuesday, 14",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            trailing: Text(
                              "-\$1380",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(),
                          ),

                          ListTile(
                            title: Text("Shop", style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontSize: 20,
                            ),),
                            subtitle: Text("Buy new clothes",
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            ),
                            trailing: Text(
                              "-\$90",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text("Electronic"),
                            subtitle: Text("Buy new iphone 14"),
                            trailing: Text(
                              "-\$1290",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )          ],
        ),
      ),
    );
  }
}
