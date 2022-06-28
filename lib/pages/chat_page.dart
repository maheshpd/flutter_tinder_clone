import 'package:flutter/material.dart';
import 'package:flutter_tinder_clone/data/chats_json.dart';
import 'package:flutter_tinder_clone/theme/colors.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Messages", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, color: primary
              ),
              ),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(color: black.withOpacity(0.15)),
              ),
              Text("Matches",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.5)
              ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 0.8,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              cursorColor: black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: "Search 0 Matches"
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 15),
              child: Text("New Matches", style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: primary
              ),),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding:  const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(chatsJson.length, (index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                chatsJson[index]['story'] ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary, width: 3
                                    )
                                  ),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            chatsJson[index]['img']
                                          ),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                ) : Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          chatsJson[index]['img']
                                        ),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                chatsJson[index]['online']
                                ? Positioned(
                                  top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: white,
                                          width: 3
                                        )
                                      ),
                                    )
                                ): Container()
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 70,
                            child: Align(
                              child: Text(
                                chatsJson[index]['name'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: List.generate(userMessages.length, (index){
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              userMessages[index]['story']
                              ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: primary, width: 3
                                  )
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          userMessages[index]['img']
                                        ),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                ),
                              ) : Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        userMessages[index]['img']
                                      ),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                              userMessages[index]['online']
                              ? Positioned(
                                top: 48,
                                  left: 52,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: white, width: 3
                                      )
                                    ),
                                  )
                              ) : Container()
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userMessages[index]['name'],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 135,
                              child: Text(
                                userMessages[index]['message'] + " - " + userMessages[index]['created_at'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: black.withOpacity(0.8)
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        )
      ],
    );
  }
}
