import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import '../colors/Colors.dart';

class EditAdPage extends StatefulWidget {
  final int oldPrice;
  final String oldTypeSelected;
  final String oldTitle;
  final String oldCategorySelected;
  final String oldHashtags;
  final String oldUnitSelected;
  final String oldDescription;
  final bool oldUseLocation;
  final void Function() closeMenuFromContainer;
  final void Function() onClickMenuButtonHandler;

  EditAdPage({
      this.oldPrice,
      this.oldTypeSelected,
      this.oldTitle,
      this.oldCategorySelected,
      this.oldHashtags,
      this.oldUnitSelected,
      this.oldDescription,
      this.oldUseLocation,
      this.closeMenuFromContainer,
      this.onClickMenuButtonHandler,
  });

  @override
  _EditAdPageState createState() => new _EditAdPageState();
}

class _EditAdPageState extends State<EditAdPage> {

  int price;
  String typeSelected;
  String title;
  String categorySelected;
  String hashtags;
  String unitSelected;
  String description;
  bool useLocation = false;
  bool isCollapsed = false;
  bool showModal = false;

  List<String> adTypes = ["Venta", "Regalo","Arriendo"];
  List<String> categories = ["Comida", "Tecnología","Muebles","Celulares"];
  List<String> unities = ["la unidad", "el kilo", "mesual"];

  Future<File> imageFile;
 
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }
 
  Widget imageSelector(Size size) {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: (size.width * 0.106) + 4,
                width: (size.width * 0.106) + 4,
                child: FittedBox(
                  child: Image.file( snapshot.data),
                  fit: BoxFit.cover,
                )
              ),
              GestureDetector(
                onTap: () {
                  if (isCollapsed) {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                    widget.closeMenuFromContainer();
                  }
                  else {
                    setState(() {
                      imageFile = null;
                    });
                  }
                },
                child: Text(
                  "Eliminar imagen",
                  style: TextStyle(color: Color(0xffF56565)),
                )
              ),
            ],
          );
        }
        else {
          return Row(
            children: <Widget>[
              DottedBorder(
                color: Colors.white,
                dashPattern: [4, 4], 
                strokeWidth: 2,
                child: GestureDetector(
                  child: Container(
                    height: size.width * 0.106,
                    width: size.width * 0.106,
                    child: Center(
                      child: Icon(FeatherIcons.plus, color: ThemeColors.gray[100]),
                    ),
                  ),
                  onTap: () {
                    if (isCollapsed) {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                      widget.closeMenuFromContainer();
                    }
                    else {
                      pickImageFromGallery(ImageSource.gallery);
                    }
                  },
                )
              ),
              snapshot.error != null
              ? Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text("Ha ocurrido un error selecciondo una imagen"),
              )
              : Container()
            ],
          );
        }
      },
    );
  }
  
  @override
  void initState() {
    super.initState();
    unitSelected = widget.oldUnitSelected;
    price = widget.oldPrice;
    typeSelected = widget.oldTypeSelected;
    title = widget.oldTitle;
    categorySelected = widget.oldCategorySelected;
    hashtags = widget.oldHashtags;
    description = widget.oldDescription;
    useLocation = widget.oldUseLocation;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (isCollapsed) {
            setState(() {
              isCollapsed = !isCollapsed;
            });
            widget.closeMenuFromContainer();
          }
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.064, vertical: size.width * 0.1),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.width * 0.056,),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Tipo",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            Container(
                              height: 36,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ThemeColors.gray[800],
                                  value: typeSelected,
                                  icon: Icon(FeatherIcons.chevron_down, color: ThemeColors.gray[100]),
                                  isExpanded: true,
                                  hint: Text(
                                    'Seleccione un tipo',
                                    style: TextStyle(
                                      color: Colors.grey[600]
                                    )
                                  ),
                                  onChanged: isCollapsed ? null : (newValue) {
                                    setState(() {
                                      typeSelected = newValue;
                                    });
                                  },
                                  items: adTypes.map((String val) {
                                    return DropdownMenuItem(
                                      key: Key(val),
                                      value: val,
                                      child: Text(val, style: TextStyle(color: ThemeColors.gray[100]),),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              color: ThemeColors.gray[400],
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Título",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            Container(
                              height: 36,
                              child: TextField(
                                enabled: !isCollapsed,
                                style: TextStyle(color: ThemeColors.gray[100]),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  hintText: title,
                                  hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                              )
                            ),
                            Container(
                              color: ThemeColors.gray[400],
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Categoría",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            Container(
                              height: 36,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ThemeColors.gray[800],
                                  value: categorySelected,
                                  icon: Icon(FeatherIcons.chevron_down, color: ThemeColors.gray[100]),
                                  isExpanded: true,
                                  hint: Text(
                                    'Seleccione una categoría',
                                    style: TextStyle(
                                      color: Colors.grey[600]
                                    )
                                  ),
                                  onChanged: isCollapsed ? null : (newValue) {
                                    setState(() {
                                      categorySelected = newValue;
                                    });
                                  },
                                  items: categories.map((String val) {
                                    return DropdownMenuItem(
                                      key: Key(val),
                                      value: val,
                                      child: Text(val, style: TextStyle(color: ThemeColors.gray[100]),),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              color: ThemeColors.gray[400],
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hashtags",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            Container(
                              height: 36,
                              child: TextField(
                                enabled: !isCollapsed,
                                style: TextStyle(color: ThemeColors.gray[100]),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  hintText: hashtags,
                                  hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    hashtags = value;
                                  });
                                },
                              )
                            ),
                            Container(
                              color: ThemeColors.gray[400],
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Publicar en mi ubicación por defecto",
                              style: TextStyle(color: ThemeColors.gray[400]),
                            ),
                            CupertinoSwitch(
                              trackColor: ThemeColors.gray[400],
                              activeColor: ThemeColors.green[400],
                              value: useLocation,
                              onChanged: (value) {
                                setState(() {
                                  useLocation = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      typeSelected != "Regalo"
                      ? Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Precio",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            Container(
                              height: 36,
                              child: Stack(
                                children: <Widget>[
                                  TextField(
                                    enabled: !isCollapsed,
                                    style: TextStyle(color: ThemeColors.gray[100]),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 10),
                                      hintText: "\$" + price.toString(),
                                      hintStyle: TextStyle(color: Colors.grey[600])
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        hashtags = value;
                                      });
                                    },
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          dropdownColor: ThemeColors.gray[800],
                                          value: unitSelected,
                                          icon: Icon(FeatherIcons.chevron_down, color: ThemeColors.gray[100]),
                                          onChanged: isCollapsed ? null : (newValue) {
                                            setState(() {
                                              unitSelected = newValue;
                                            });
                                          },
                                          hint: Text(
                                            'Unidad',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 12
                                            )
                                          ),
                                          items: unities.map((String val) {
                                            return DropdownMenuItem(
                                              value: val,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 4),
                                                child: Text(
                                                  val,
                                                  style: TextStyle(
                                                    color: ThemeColors.gray[100],
                                                    fontSize: 14
                                                  )
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: ThemeColors.gray[400],
                              height: 1,
                            ),
                          ],
                        ),
                      )
                      : Container(),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Descripción",
                              style: TextStyle(
                                color: ThemeColors.gray[400],
                                fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ThemeColors.gray[400],
                                ),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: TextField(
                                enabled: !isCollapsed,
                                maxLength: 240,
                                style: TextStyle(color: ThemeColors.gray[100]),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: description,
                                  hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    description = value;
                                  });
                                },
                              )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "Imagen",
                                  style: TextStyle(
                                    color: ThemeColors.gray[400],
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            imageSelector(size),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.064),
                        child: GestureDetector(
                          child: Container(
                            height: size.width * 0.128,
                            decoration: BoxDecoration(
                              color: ThemeColors.gray[800],
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(
                              child: Text(
                                "Guardar cambios",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                          ),
                          onTap: () {
                            if (isCollapsed) {
                              setState(() {
                                isCollapsed = !isCollapsed;
                              });
                              widget.closeMenuFromContainer();
                            }
                            else {
                              setState(() {
                                showModal = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: ThemeColors.gray[900],
                height: size.width * 0.106,
                alignment: Alignment.topLeft,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: size.width * 0.106,
                          height: size.width * 0.106,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColors.gray[800],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0,
                                blurRadius: 5,
                              )
                            ]
                          ),
                          child: Icon(FeatherIcons.menu, color: ThemeColors.gray[100]),
                        ),
                        onTap: () {
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                          widget.onClickMenuButtonHandler();
                        },
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Color(0xffF56565),
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              showModal
              ? Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                    child: Center(
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Ha ocurrido un error",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.gray[900]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.12, vertical: size.width * 0.05),
                              child: Text(
                                "No hemos podido editar tu anuncio, por favor, comprueba tu conexión a internet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: ThemeColors.gray[900]
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF56565),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              height: size.width * 0.086,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      showModal = false;
                                    });
                                  },
                                  child: Text(
                                    "Entendido",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                    ),
                                  )
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : Container()
            ],
          ),
        ),
      ),
    );
  }
}