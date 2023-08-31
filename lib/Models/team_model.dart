class TeamModel{
   String fullName;
   String shortName;
   String flag;

   TeamModel(
   {
     required this.fullName,
     required this.shortName,
     required this.flag
   });
   static TeamModel fromJSON(Map <String,dynamic>map){
     return TeamModel(
         fullName:map ['fullName'],
         shortName:map ['shortName'],
         flag:map ['flag'],
     );

   }
}