import 'package:flutter/material.dart';
import 'package:hack_infor/models/mobile_model.dart';
import 'package:hack_infor/provider/mobiles_provider.dart';
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
              TextFormField(
                initialValue: _formData['modelo'],
                decoration: InputDecoration(labelText: 'Modelo'),
                textInputAction: TextInputAction.next, // muda para o próximo
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_marcaFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['modelo'] = value,
              ),
              TextFormField(
                initialValue: _formData['marca'],
                decoration: InputDecoration(labelText: 'Marca'),
                textInputAction: TextInputAction.next, // muda para o próximo
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imeiFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['marca'] = value,
              ),
              TextFormField(
                initialValue: _formData['imei'],
                decoration: InputDecoration(labelText: 'IMEI'),
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
              TextFormField(
                initialValue: _formData['usuario'],
                decoration: InputDecoration(labelText: 'Usuário'),
                textInputAction: TextInputAction.next, // muda para o próximo
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_prvFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['usuario'] = value,
              ),
              TextFormField(
                initialValue: _formData['prv'],
                decoration: InputDecoration(labelText: 'PRV'),
                textInputAction: TextInputAction.next, // muda para o próximo
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_operadoraFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['prv'] = value,
              ),
              TextFormField(
                initialValue: _formData['operadora'],
                decoration: InputDecoration(labelText: 'Operadora'),
                textInputAction: TextInputAction.next, // muda para o próximo
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dddFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['operadora'] = value,
              ),
              TextFormField(
                initialValue: _formData['ddd'],
                decoration: InputDecoration(labelText: 'DDD'),
                textInputAction: TextInputAction.next, // muda para o próximo
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_numeroFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['ddd'] = value,
              ),
              TextFormField(
                initialValue: _formData['numero'],
                decoration: InputDecoration(labelText: 'Numero'),
                textInputAction: TextInputAction.next, // muda para o próximo
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_marcaFocusNode);
                },
                //onSaved vai executar o _saveForm
                onSaved: (value) => _formData['numero'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
