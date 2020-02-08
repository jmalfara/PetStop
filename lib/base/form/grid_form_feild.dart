import 'package:flutter/material.dart';

class GridItem<T> {
  final Widget view;
  final T item;

  GridItem(this.view, this.item);
}

class GridFormField<T> extends FormField<T> {
  final GridFormFieldController<T> controller;

  GridFormField({
    this.controller,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    Function(T) onChange,
    @required List<GridItem<T>> items,
    T initialValue,
  }) : super(
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<T> state) {
        return Column(
          children: <Widget>[
            GridView.count(
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: items.map((item) {
                return RaisedButton(
                  onPressed: (state.value == item.item) ? null : () {
                    return state.didChange(item.item);
                    },
                  child: item.view,
                  shape: new CircleBorder(),
                  padding: const EdgeInsets.all(15.0),
                );
              }).toList(),
            ),
            state.hasError?
            Text(
              state.errorText,
              style: TextStyle(
                color: Colors.red,
              ),
              textAlign: TextAlign.start,
            ) :
            Container()
          ],
        );
      }
  );

  @override
  FormFieldState<T> createState() {
    FormFieldState<T> state = super.createState();
    controller?.state = state;
    return state;
  }
}

class GridFormFieldController<T>  {
  FormFieldState<T> state;

  T value() {
    return state.value;
  }

  clear() {
    state.reset();
  }
}