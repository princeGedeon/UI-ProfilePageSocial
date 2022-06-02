import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:BasicPage() ,
    );
  }
}

class BasicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinceNetworkf Profile"),
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/art-1478831_1920.jpg",height: 200,width: size.width,fit: BoxFit.cover,),
               Padding(padding: EdgeInsets.only(top:130),
                child:CircleAvatar(radius: 75,backgroundColor: Colors.white,
                child: myProfile(65),
               )
               )

              ],
            ),
            Row(
              children: [
                Spacer(),
                Text("GUEDJE PrinceGédéon",
                  style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25),),
                Spacer()
              ],
            )


            ,
            Padding(padding: EdgeInsets.all(10),
            child: Text("Je suis passionné par l'Intelligence Artificielle",
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,)
              ,),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier mon profile"))
                ,
                buttonContainer(icon: Icons.border_color)

              ],
            ),
            Divider(thickness: 2,),
            sectionTileText("A propos de moi"),
            aboutRow(icon:Icons.house,text:"Cotonou" ),
            aboutRow(icon: Icons.work, text: "Developpeur Python"),
            aboutRow(icon: Icons.favorite, text: "Célibataire"),
            Divider(thickness: 2,),
            sectionTileText("Amis"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: allFriend(size.width/3),
            ),
            Divider(),
            sectionTileText("Mes Posts"),
            post(time: "5 minutes", image: "images/art-1478831_1920.jpg", desc: "Petit tour"),
            post(time: "2 jours", image: "images/6fa0afed513916e53a712f57e38292e5.jpg", desc: "Oui j'ai de la flemme",likes: 38),

            post(time: "2 ans", image: "images/318875_1519215629_318809-1519118398-sante-ia.jpg", desc: "Flemme Bof bof bof bof bof ...",likes: 50,comments: 80),





          ],
        )
        
      ),
    );
  }

  CircleAvatar myProfile(double radius)
  {
    return CircleAvatar(
      radius: radius,backgroundImage: AssetImage("images/children-1822688_1920.jpg"),
    );
  }

  Container buttonContainer({IconData? icon,String? text}){
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: (icon==null)?
      Center(child:Text(text??"",style: TextStyle(color: Colors.white)),):Icon(icon,color: Colors.white,),
    );
  }

  Widget sectionTileText(String text){
    return Padding(padding: EdgeInsets.all(5),
    child: Text(text,style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    ),);
  }

  Widget aboutRow({required IconData icon,required String text})
  {
    return Row(
      children: [
        Icon(icon),
        Padding(padding: EdgeInsets.all(15),
        child: Text(text),)

      ],
    );
  }

  Column friendsImage(String name,String imagePath,double width){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),fit: BoxFit.cover,
              
            )
          ),
        ),
        Text(name)
      ],
    );
  }

  Row allFriend(double width){
    Map<String,String> friends= {
      "Prince": "images/terminator-3_5205795 (1).jpg",
      "Eren":"images/art-1478831_1920.jpg",
      "Médécin":"images/318875_1519215629_318809-1519118398-sante-ia.jpg",
      "Ackerman":'images/Sprühen-PRO-2.jpg'
    };
    List<Widget> children=[];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
        return Row(children: children,);
  }
  
  Container post({required String time,required String image,required String desc,int likes=0,int comments=0})
  {
    return Container(
      margin: EdgeInsets.only(top: 8,left: 3,right: 3),
      padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 255, 225,1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfile(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Prince Gédéon"),
              Spacer(),
              timeText(time),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8,bottom: 8,)
          ,child: Image.asset(image,fit: BoxFit.cover,),),

          Text(desc,style: TextStyle(
            color: Colors.lightBlueAccent,

          ),
          textAlign: TextAlign.center,),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.favorite),
              Text('$likes likes'),
              Icon(Icons.message),
              Text("$comments Commentaires")
            ],
          )
         
        ],
      ),
    );
  }
Text timeText(String time)
{
  return Text("Il y a $time",style: TextStyle(color: Colors.blue),);
}
}

