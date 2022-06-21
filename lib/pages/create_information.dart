import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/pages/components/select_order_template.dart';

final _formKey = GlobalKey<FormBuilderState>();

class CreateInformation extends HookWidget {
  const CreateInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Создание информации')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'title',
                      decoration: InputDecoration(
                        labelText: 'Назови информацию',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(
                          4,
                          errorText: 'не меньше 4 символов',
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormBuilderTextField(
                      name: 'description',
                      decoration: InputDecoration(
                        labelText: 'Опиши о чем твоя информация',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(
                          4,
                          errorText: 'не меньше 4 символов',
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormBuilderTextField(
                      name: 'information',
                      decoration: InputDecoration(
                        labelText: 'Информация, не видна до покупки',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(
                          4,
                          errorText: 'не меньше 4 символов',
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormBuilderTextField(
                      name: 'price',
                      decoration: const InputDecoration(
                        labelText: 'Цена',
                        suffix: Text('Руб.'),
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.numeric(
                            errorText: 'нужны чиселки'),
                        FormBuilderValidators.min(100,
                            errorText: 'нужно больше деняг'),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                _formKey.currentState!.save();
                print(_formKey.currentState!.value);
                final price = _formKey.currentState!.value['price']!;
                try {
                  await Network.I.createInformation(
                    price: double.parse(price),
                    title: _formKey.currentState!.value['title']!,
                    description: _formKey.currentState!.value['description']!,
                    information: _formKey.currentState!.value['information']!,
                  );
                } catch (err, sttr) {
                  print(err);
                  print(sttr);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Сорян что-то не так, мы все починим'),
                  ));
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Информация доступна для покупки. Пошли к твоим информациям?'),
                  action: SnackBarAction(
                    label: 'Пошли',
                    onPressed: () {
                      context.go('/');
                      context.push('/informations');
                    },
                  ),
                ));
              },
              child: const Text('Опубликовать'),
            ),
          ],
        ),
      ),
    );
  }
}
