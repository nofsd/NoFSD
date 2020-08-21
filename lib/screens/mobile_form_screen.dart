import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MobileFormScreen extends StatefulWidget {
  @override
  _MobileFormScreenState createState() => _MobileFormScreenState();
}

class _MobileFormScreenState extends State<MobileFormScreen> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  final _marcaFocusNode = FocusNode();
  final _imeiFocusNode = FocusNode();
  final _usuarioFocusNode = FocusNode();
  final _prvFocusNode = FocusNode();
  final _operadoraFocusNode = FocusNode();
  final _dddFocusNode = FocusNode();
  final _numeroFocusNode = FocusNode();
  final _pinFocusNode = FocusNode();
  final _dataLocacaoFocusNode = FocusNode();
  final _dataDevolucaoFocusNode = FocusNode();
  final _statusFocusNode = FocusNode();
  final _tipoFocusNode = FocusNode();
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    //
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final mobile = ModalRoute.of(context).settings.arguments as MobileModel;

      if (mobile != null) {
        _formData['modelo'] = mobile.modelo;
        _formData['marca'] = mobile.marca;
        _formData['imei'] = mobile.imei;
        _formData['usuario'] = mobile.usuario;
        _formData['prv'] = mobile.prv;
        _formData['operadora'] = mobile.operadora;
        _formData['ddd'] = mobile.ddd;
        _formData['numero'] = mobile.numero;
        _formData['pin'] = mobile.pin;
        _formData['dataLocacao'] = mobile.dataLocacao;
        _formData['dataDevolucao'] = mobile.dataDevolucao;
        _formData['status'] = mobile.status;
        _formData['tipo'] = mobile.tipo;
      } else {
        _formData['marca'] = '';
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _marcaFocusNode.dispose();
    _imeiFocusNode.dispose();
    _usuarioFocusNode.dispose();
    _prvFocusNode.dispose();
    _operadoraFocusNode.dispose();
    _dddFocusNode.dispose();
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    //vai chamar o onsave em cada um dos campos do formulário
    _form.currentState.save();

    final mobile = MobileModel(
      id: _formData['id'],
      modelo: _formData['modelo'],
      marca: _formData['marca'],
      imei: _formData['imei'],
      usuario: _formData['usuario'],
      prv: _formData['prv'],
      operadora: _formData['operadora'],
      ddd: _formData['ddd'],
      numero: _formData['numero'],
      pin: _formData['pin'],
      dataLocacao: _formData['dataLocacao'],
      dataDevolucao: _formData['dataDevolucao'],
      status: _formData['status'],
      tipo: _formData['tipo'],
      //status: int.parse(_formData['status']),
      tradeIn: _formData['tradeIn'],
    );

    setState(() {
      _isLoading = true;
    });

    final mobiles = Provider.of<MobilesProvider>(context, listen: false);
    try {
      if (_formData['id'] == null) {
        await mobiles.addMobile(mobile);
      } else {
        await mobiles.updateMobile(mobile);
      }
      Navigator.of(context).pop();
    } catch (e) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro!'),
          content: Text('Ocorreu um erro ao salvar aparelho!'),
          actions: [
            FlatButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vincular Aparelho Mobile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveForm(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    width: 180,
                    child: TextFormField(
                      initialValue: _formData['modelo'],
                      decoration: InputDecoration(
                        labelText: 'Modelo',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction:
                          TextInputAction.next, // muda para o próximo
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_marcaFocusNode);
                      },
                      //onSaved vai executar o _saveForm
                      onSaved: (value) => _formData['modelo'] = value,
                    ),
                  ),
                  Container(
                    width: 180,
                    padding: EdgeInsets.all(1),
                    child: TextFormField(
                      initialValue: _formData['marca'],
                      decoration: InputDecoration(
                        labelText: 'Marca',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction:
                          TextInputAction.next, // muda para o próximo
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_imeiFocusNode);
                      },
                      //onSaved vai executar o _saveForm
                      onSaved: (value) => _formData['marca'] = value,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['imei'],
                  decoration: InputDecoration(
                    labelText: 'IMEI',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_usuarioFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['imei'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['usuario'],
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_prvFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['usuario'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['prv'],
                  decoration: InputDecoration(
                    labelText: 'PRV',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_operadoraFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['prv'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['operadora'],
                  decoration: InputDecoration(
                    labelText: 'Operadora',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_dddFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['operadora'] = value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    width: 70,
                    child: TextFormField(
                      initialValue: _formData['ddd'],
                      decoration: InputDecoration(
                        labelText: 'DDD',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction:
                          TextInputAction.next, // muda para o próximo
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_numeroFocusNode);
                      },
                      //onSaved vai executar o _saveForm
                      onSaved: (value) => _formData['ddd'] = value,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(1),
                    width: 140,
                    child: TextFormField(
                      initialValue: _formData['numero'],
                      decoration: InputDecoration(
                        labelText: 'Numero',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction:
                          TextInputAction.next, // muda para o próximo
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_pinFocusNode);
                      },
                      //onSaved vai executar o _saveForm
                      onSaved: (value) => _formData['numero'] = value,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(1),
                    width: 100,
                    child: TextFormField(
                      initialValue: _formData['pin'],
                      decoration: InputDecoration(
                        labelText: 'Pin',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction:
                          TextInputAction.next, // muda para o próximo
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_dataLocacaoFocusNode);
                      },
                      //onSaved vai executar o _saveForm
                      onSaved: (value) => _formData['pin'] = value,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['dataLocacao'],
                  decoration: InputDecoration(
                    labelText: 'Data da Locação',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_dataDevolucaoFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['dataLocacao'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['dataDevolucao'],
                  decoration: InputDecoration(
                    labelText: 'Data da Devolução',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_statusFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['dataDevolucao'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['status'].toString(),
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_tipoFocusNode);
                  },
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['status'] = value,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  initialValue: _formData['tipo'],
                  decoration: InputDecoration(
                    labelText: 'Tipo',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next, // muda para o próximo
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                  ),
                  //onSaved vai executar o _saveForm
                  onSaved: (value) => _formData['tipo'] = value,
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () {
                  ImagePicker()
                      .getImage(source: ImageSource.camera)
                      .then((file) {
                    if (file == null) return;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
