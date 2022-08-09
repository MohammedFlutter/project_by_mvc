
class Note  {
  final int? id;
  late String title;
  late String discription;

  Note(this.title, this.discription, {this.id});

  Map<String, String> toMap(){
    return{
      "title":title,
      "description":discription
    };
  }
}
