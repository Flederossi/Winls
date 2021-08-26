import 'dart:io';

void main(List<String> args) async{
  String ges = "";
  Directory current = Directory.current;
  if (args.length != 0){
    current = Directory(args[0]);
  }
  List<FileSystemEntity> entities = await current.list().toList();
  for (var i = 0; i < entities.length; i++){
    String check = entities[i].toString().split("'")[1];
    List splitted = entities[i].toString().split("\\");
    if (File(check).existsSync()){
      List extension = splitted[splitted.length - 1].split("'")[0].split(".");
      if (extension[extension.length - 1] == "zip"){
        ges += "\x1B[31m'" + splitted[splitted.length - 1] + "\x1B[0m ";
      }else{
        ges += "\x1B[32m'" + splitted[splitted.length - 1] + "\x1B[0m ";
      }
    }else{
      ges += "\x1B[34m'" + splitted[splitted.length - 1] + "\x1B[0m ";
    }
  }
  print(ges);
}