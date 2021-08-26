import 'dart:io';

void main(List<String> args) async{
  List compressedFormats = ["zip", "tar", "gz", "7z"];
  String res = "";
  Directory current = Directory.current;
  if (args.length != 0){
    current = Directory(args[0]);
  }
  List<FileSystemEntity> entities = await current.list().toList();
  for (var i = 0; i < entities.length; i++){
    String check = entities[i].toString().split(":")[0];
    List splitted = entities[i].toString().split("\\");
    if (check == "File"){
      String extension = splitted.last.split(".").last.split("'")[0];
      if (compressedFormats.contains(extension)){
        res += "\x1B[31m'" + splitted[splitted.length - 1] + "\x1B[0m ";
      }else{
        res += "\x1B[32m'" + splitted[splitted.length - 1] + "\x1B[0m ";
      }
    }else{
      res += "\x1B[34m'" + splitted[splitted.length - 1] + "\x1B[0m ";
    }
  }
  print(res);
}