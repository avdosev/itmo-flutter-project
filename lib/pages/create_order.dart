import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/models/artefact.dart';
import 'package:mpi_front/pages/components/select_order_template.dart';

final _formKey = GlobalKey<FormBuilderState>();

class CreateOrder extends HookWidget {
  const CreateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(title: Text('Создание заказа')),
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
                      name: 'name',
                      decoration: const InputDecoration(
                        labelText: 'Название артефакта',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(
                          4,
                          errorText:
                              'название должно быть не меньше 4 символов',
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
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'location',
                      decoration: const InputDecoration(
                        labelText: 'Адрес заказа',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'обязательно'),
                        FormBuilderValidators.minLength(8,
                            errorText: 'где-где?'),
                      ]),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    FormBuilderDateTimePicker(
                      name: 'deadline',
                      decoration: const InputDecoration(
                        labelText: 'password',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: (DateTime? dateTime) {
                        if (dateTime == null) return 'обзятельно';
                        if (dateTime.isBefore(
                            DateTime.now().add(const Duration(days: 3)))) {
                          return 'нам нужно не меньше 3 дней';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final template =
                    await Navigator.of(context).push<ArtefactTemplate>(
                  MaterialPageRoute(
                    builder: (context) => TemplateOrderSelector(),
                  ),
                );
                if (template == null) return;
                _formKey.currentState!.patchValue({
                  'name': template.name,
                  'price': template.price.toString(),
                });
                icon.value = template.artefact.url;
              },
              child: const Text('Выбрать шаблон'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Опубликовать'),
            ),
          ],
        ),
      ),
    );
  }
}
