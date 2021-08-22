import 'dart:io';

void main() async{
  String ges = "";
  Directory current = Directory.current;
  List<FileSystemEntity> entities = await current.list().toList();
  for (var i = 0; i < entities.length; i++){
    List splitted = entities[i].toString().split("\\");
    ges += "'" + splitted[splitted.length - 1] + " ";
  }
  print(ges);
}