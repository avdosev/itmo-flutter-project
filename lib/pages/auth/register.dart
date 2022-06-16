import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 400,
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    FormBuilderChoiceChip<UserType>(
                      name: 'user_role',
                      decoration: const InputDecoration(
                        labelText: 'Дайте нам знать кто вы',
                      ),
                      runSpacing: 10,
                      spacing: 10,
                      options: [
                        ...UserType.list.map(
                          (e) => FormBuilderChipOption(
                            value: e,
                            child: Text(e.runame),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Ваш email',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.email(
                            errorText: 'что-то у вас не такой email'),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: 'password',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(8,
                            errorText: 'не меньше 8 символов'),
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  print(_formKey.currentState!.value);
                  try {
                    final auth = await Network.I.register(
                      email: _formKey.currentState!.value['email'],
                      password: _formKey.currentState!.value['password'],
                      role: _formKey.currentState!.value['user_role'],
                    );
                    context.read<AppState>().auth(auth);
                  } catch (err) {
                    print(err);
                  }
                } else {
                  print("validation failed");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
