class Post{
  String name;
  String time;
  String imagePath;
  String desc;
  int likes;
  int comments;

  Post({
    required this.name,
    required this.time,
    required this.desc,
    required this.imagePath,
    this.likes=0,
    this.comments=0
});
  String setLikes()
  {
    return "$likes j'aime";
  }

  String setTime()=>"Il y a $time";

  String setComments(){
    if (comments>1)
      {
        return "$comments commentaires";
      }
    else
      {
        return "$comments commentaire";
      }
  }
}