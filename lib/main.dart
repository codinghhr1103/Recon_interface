import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}


class MainPage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.greenAccent ,
      appBar: AppBar
      (
        toolbarHeight: 70,
        //leading:Image(image: AssetImage('assets/BNU.png'),fit: BoxFit.cover,),
        centerTitle: true,
        title: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            //Image(image: AssetImage('assets/BNU_AI.png'),fit: BoxFit.cover,), 
            

            Tooltip
            (
              message: '三维物体重建程序',
              child:
              GestureDetector
              (
                onTap: () 
                { 
                  Navigator.push( context, MaterialPageRoute(builder: (context) => FirstSubpage()));
                },
                child:
                Text("物体重建", style: TextStyle(fontSize: 30,fontFamily: 'Regular' ))
              ),
            ),

            SizedBox(width: 30.0,),

            Tooltip
            (
              message: '查看重建物体',
              child:
              GestureDetector
              (
                onTap: () 
                { 
                  Process.start(r'C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\show_result\show_object.exe',[]); 
                },
                child:
                Text("查看结果", style: TextStyle(fontSize: 30,fontFamily: 'Regular' ))
              ),
            ),

            SizedBox(width: 30.0,),
            
            Tooltip
            (
              message: '运行三维场景重建程序',
              child:
              GestureDetector
              (
                onTap: () 
                { 
                  Process.start(r'C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\SceneRecon\SceneReconstructure2.bat',[]); 
                  showAlertDialog(context);
                },
                child:
                Text("场景重建", style: TextStyle(fontSize: 30, fontFamily: 'Regular'))
              ),
            ),

            SizedBox(width: 30.0,),

            Tooltip
            (
              message: '查看重建场景',
              child:
              GestureDetector
              (
                onTap: () 
                { 
                  Process.start(r'C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\show_result\show_scene.exe',[]); 
                },
                child:
                Text("查看结果", style: TextStyle(fontSize: 30, fontFamily: 'Regular'))
              ),
            ),

          ]
        )
      ),
      
      body: Container
      (
        width: MediaQuery.of(context).size.width ,//double.infinity,
        height: MediaQuery.of(context).size.height, //double.infinity,
        color:Colors.white,
        
       
      )
    );
  }
}



  void select_upload_1() async  {


  String? path_of_source_file = await FilePicker.platform.saveFile(
  dialogTitle: '请输入文件名',
  fileName: 'file.ply',
  initialDirectory: r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\DATA",
  allowedExtensions: ['ply']
  );

  if(path_of_source_file!=null)
  {
      File source_file=File(path_of_source_file);
      File destination_file=File(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\SOURCE\file1.ply");
      destination_file.writeAsString(await source_file.readAsString());
  }
}

 void select_upload_2() async  {

  String? path_of_source_file = await FilePicker.platform.saveFile(
  dialogTitle: '请输入文件名',
  fileName: 'file.ply',
  initialDirectory: r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\DATA",
  allowedExtensions: ['ply']
  );

  if(path_of_source_file!=null)
  {
      File source_file=File(path_of_source_file);
      File destination_file=File(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\SOURCE\file2.ply");
      destination_file.writeAsString(await source_file.readAsString());
  }
}

void select_upload_3() async  {

  String? path_of_source_file = await FilePicker.platform.saveFile(
  dialogTitle: '请输入文件名',
  fileName: 'file.ply',
  initialDirectory: r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\DATA",
  allowedExtensions: ['ply']
  );

  if(path_of_source_file!=null)
  {
      File source_file=File(path_of_source_file);
      File destination_file=File(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\SOURCE\file3.ply");
      destination_file.writeAsString(await source_file.readAsString());
  }
}



// Show AlertDialog
showAlertDialog(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: Text("正在重建，请稍等。"),
    actions: [
      ElevatedButton(
        child: Text("好的"),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
      
    ],
  );

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    }
  );
}


  var parameters = [
    'd_th',
    'n_th',
    'file1_knn',
    'file2_knn',
    'file3_knn',
    'file1_smooth',
    'file2_smooth',
    'file3_smooth',
    'merge_knn',
    'merge_smooth',
    'reconstrcture_samples',
  ];

TextEditingController controllers_1 =new TextEditingController(text:config_map[parameters[0]]);
TextEditingController controllers_2 =new TextEditingController(text:config_map[parameters[1]]);
TextEditingController controllers_3 =new TextEditingController(text:config_map[parameters[2]]);
TextEditingController controllers_4 =new TextEditingController(text:config_map[parameters[3]]);
TextEditingController controllers_5 =new TextEditingController(text:config_map[parameters[4]]);
TextEditingController controllers_6 =new TextEditingController(text:config_map[parameters[5]]);
TextEditingController controllers_7 =new TextEditingController(text:config_map[parameters[6]]);
TextEditingController controllers_8 =new TextEditingController(text:config_map[parameters[7]]);
TextEditingController controllers_9 =new TextEditingController(text:config_map[parameters[8]]);
TextEditingController controllers_10 =new TextEditingController(text:config_map[parameters[9]]);
TextEditingController controllers_11 =new TextEditingController(text:config_map[parameters[10]]);



File config_file = File(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\config.json");
String config_string= config_file.readAsStringSync();                      
Map<String, dynamic> config_map = jsonDecode(config_string);



class FirstSubpage extends StatelessWidget
{
  int selectedValue = 1;


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.white ,
      appBar: AppBar
        (
          toolbarHeight: 70,
          //leading:Image(image: AssetImage('assets/BNU.png'),fit: BoxFit.cover,),
          centerTitle: true,
          title: Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              /*
                  Tooltip
                  (
                    message: '保存参数值',
                    child:
                    GestureDetector
                    (
                      onTap: () 
                      {
                        File file = File(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\config.json"); 
                        file.writeAsString(myController.text);
                      }, 
                      child:
                      Text("保存参数值", style: TextStyle(fontSize: 30, fontFamily: 'Regular')),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                */

                  
                  
                  DropdownButton
                  (
               
                    // Initial Value
                    value: selectedValue,
                    
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down), 

                    
                    
                    // Array list of items
                    items: 
                    [
                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_1,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['d_th'],
                                labelText: "d_th",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 0,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_2,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['n_th'],
                                labelText: "n_th",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 1,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_3,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file1_knn'],
                                labelText: "file1_knn",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 2,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_4,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file2_knn'],
                                labelText: "file2_knn",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 3,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_5,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file3_knn'],
                                labelText: "file3_knn",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 4,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_6,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file1_smooth'],
                                labelText: "file1_smooth",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 5,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_7,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file2_smooth'],
                                labelText: "file2_smooth",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 6,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_8,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['file3_smooth'],
                                labelText: "file3_smooth",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 7,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_9,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['merge_knn'],
                                labelText: "merge_knn",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 8,
                      ),

                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_10,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['merge_smooth'],
                                labelText: "merge_smooth",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 9,
                      ),
                      DropdownMenuItem
                      (
                        child: 
                        SizedBox
                        (
                          width: 120.0,
                          child:
                          TextField
                          (
                              controller: controllers_11,
                              maxLines: 1,
                              decoration: InputDecoration
                              (
                                hintText: config_map['reconstrcture_samples'],
                                labelText: "reconstrcture_samples",
                                border: OutlineInputBorder()  
                              ),
                          ),
                        ),
                        value: 10,
                      ),
                    ],

                    onChanged: (selectedValue) 
                    {
                      
                    },
                    
                  ),
                
                  SizedBox(width: 30.0,),

                  Tooltip
                  (
                    message: '保存参数',
                    child:
                    GestureDetector
                    (
                      onTap: () 
                      {
                        config_map[parameters[0]]=controllers_1.text;
                        config_map[parameters[1]]=controllers_2.text;
                        config_map[parameters[2]]=controllers_3.text;
                        config_map[parameters[3]]=controllers_4.text;
                        config_map[parameters[4]]=controllers_5.text;
                        config_map[parameters[5]]=controllers_6.text;
                        config_map[parameters[6]]=controllers_7.text;
                        config_map[parameters[7]]=controllers_8.text;
                        config_map[parameters[8]]=controllers_9.text;
                        config_map[parameters[9]]=controllers_10.text;
                        config_map[parameters[10]]=controllers_11.text;

                        config_file.writeAsString(jsonEncode(config_map));
                      },
                      child:
                      Text("保存参数", style: TextStyle(fontSize: 30, fontFamily: 'Regular')),
                    ),
                  ),        

                  SizedBox(width: 30.0,),


                  Tooltip
                  (
                    message: '选择第一个待重建文件并上传',
                    child:
                    GestureDetector
                    (
                      onTap: () => select_upload_1(), 
                      child:
                      Text("文件1", style: TextStyle(fontSize: 30, fontFamily: 'Regular')),
                    ),
                  ),

                  SizedBox(width: 30.0,),

                  Tooltip
                  (
                    message: '选择第二个待重建文件并上传',
                    child:
                    GestureDetector
                    (
                      onTap: () => select_upload_2(), 
                      child:
                      Text("文件2", style: TextStyle(fontSize: 30, fontFamily: 'Regular')),
                    ),
                  ),
                   SizedBox(width: 30.0,),
                  Tooltip
                  (
                    message: '选择第三个待重建文件并上传',
                    child:
                    GestureDetector
                    (
                      onTap: () => select_upload_3(), 
                      child:
                      Text("文件3", style: TextStyle(fontSize: 30,fontFamily: 'Regular' )),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Tooltip
                  (
                    message: '运行三维物体重建程序',
                    child:
                    GestureDetector
                    (
                      onTap: () 
                      { 
                        Process.start(r"C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\ModelReconstructure2.bat",[]); 
                        showAlertDialog(context);
                      },
                      child:
                      Text("物体重建", style: TextStyle(fontSize: 30, fontFamily: 'Regular'))
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Tooltip
                  (
                    message: '取消重建',
                    child:
                    GestureDetector
                    (
                      onTap: () 
                      { 
                        Process.start(r'C:\Users\Public\ProgramFiles\release\PublicEXE\recon_interface\build\windows\runner\Debug\recon\ObjectRecon\CancelButton.bat',[]); 
                      },
                      child:
                      Text("取消重建", style: TextStyle(fontSize: 30, fontFamily: 'Regular'))
                    ),
                  ),

            ]
           ),
        ),
        
    
      body: Container
      (
        width: MediaQuery.of(context).size.width ,//double.infinity,
        height: MediaQuery.of(context).size.height, //double.infinity,
        color:Colors.white,
      )
       




      );      
    
  }
}
