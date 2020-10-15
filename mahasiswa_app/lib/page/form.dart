import 'package:flutter/material.dart';
import 'package:mahasiswa_app/components/componen.dart';
import 'package:mahasiswa_app/constant/cons.dart';
import 'package:mahasiswa_app/helper/mahasiswaHelper.dart';
import 'package:mahasiswa_app/model/mahasiswaModel.dart';
import 'package:mahasiswa_app/widget/textform.dart';

class FormMahasiswa extends StatefulWidget {
  final Map<String , dynamic> data;
  const FormMahasiswa({Key key, this.data}) : super(key: key);
  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {

  var iNama = TextEditingController();
  var iNim = TextEditingController();
  var iAlamat = TextEditingController();
  var iTahun = TextEditingController();
  ModelMahasiswa data;
  List sex = ['L','P'];
  var _keyForm = GlobalKey<FormState>();
  String gender;

  @override
  void initState() {
    if(widget.data!=null){
      data = ModelMahasiswa.fromMap(widget.data);
      iNama.text = data.nama;
      iNim.text = data.nim;
      iAlamat.text = data.alamat;
      iTahun.text = data.tahun.toString();
      gender = data.gender;
    }
    super.initState();
  }

  void pilihSex(String value){
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,color: kColorBlue,), 
            onPressed: () {Navigator.pop(context);}
          ),
        centerTitle: true,
        title: Text("Mahasiswa",style: kColorText,),
      ),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                  children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Card(
                      elevation: 20,
                      child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextForm(
                        textControl: iNama,
                        textHint: 'nama',
                      ),
                    ),
                  ),
                ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Card(
                      elevation: 20,
                      child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextForm(
                        textControl: iNim,
                        textHint: 'nim',
                      ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Card(
                      elevation: 20,
                      child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextForm(
                        textControl: iAlamat,
                        textHint: 'alamat',
                      ),
                      ),
                    ),
                  ),
                  Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
               child: Card(
                 elevation: 20,
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Gender',style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
                        ],
                      ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          addRadioButton(0, 'Laki-laki'),
                          addRadioButton(1, 'Perempuan'),
                        ],
                      ),
                    ], 
                   ),
                 ),
               ) 
              ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Card(
                      elevation: 20,
                      child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextForm(
                        textControl: iTahun,
                        textHint: 'angkatan',
                        numbertype: TextInputType.number,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
              GestureDetector(
                  onTap: () {
                   if(_keyForm.currentState.validate() && gender!=null){
                      iMahasiswaData();
                    } else{
                      print('galat');
                    }
                  },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: buttonGesture,
                  child:  Text(data==null ? 'Masukan Data' : 'Perbarui data', style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ), 
      ),
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Radio(
        activeColor: kColorPink,
        value: sex[btnValue],
        groupValue: gender,
        onChanged: (value){
          setState(() {
            print(value);
            pilihSex(value);
          });
        },
      ),
      Text(title,style: kColorField,)
      ],
    );
  }

  iMahasiswaData(){
    var database = DataMahasiswaHap();
    if(data==null){
      database.createMahasiswa(ModelMahasiswa(iNama.text,iNim.text,iAlamat.text,gender,int.parse(iTahun.text))).then((value){
        Navigator.pop(context, 'refresh');
        print('Create account success');
      });
    }else{
      Map<String, dynamic> _input = {
        "id": data.id,
        "nama": iNama.text,
        "nim": iNim.text,
        "alamat": iAlamat.text,
        "gender": gender,
        "tahun": int.parse(iTahun.text),
      };
      database.updateMahasiswa(ModelMahasiswa.fromMap(_input)).then((value){
        Navigator.pop(context, 'refresh');
        print('Update success');
      });
    }
  }

}

