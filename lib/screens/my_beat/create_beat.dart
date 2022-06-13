import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/blocs/app_bloc.dart';
import 'package:hotel_booking/blocs/bloc.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/constant.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/utils/snack_bar.dart';
import 'package:hotel_booking/utils/widget_extension.dart';
import 'package:hotel_booking/widgets/text_input_field.dart';
import 'package:intl/intl.dart';

import 'dialog_type_beat.dart';

class CreateBeat extends StatefulWidget {
  const CreateBeat({Key? key}) : super(key: key);

  @override
  State<CreateBeat> createState() => _CreateBeatState();
}

class _CreateBeatState extends State<CreateBeat> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _authorEmailController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? type;
  String? uploadDate;
  String? pathFileBeat;
  String? pathFileImage;
  bool checked1 = false;
  bool checked2 = false;
  final BeatModel newBeat = new BeatModel.initial(UserRepository.currentUser!);
  @override
  void initState() {
    _getCurrentDate();
    super.initState();
  }

  _getCurrentDate() {
    final DateTime current = DateTime.now();
    setState(() {
      uploadDate = DateFormat(dateFormat).format(current);
      newBeat.createDate = current.toUtc().toString();
    });
  }

  _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        pathFileBeat = file.path;
        newBeat.thumbnail.audio = file.path;
      });
    }
  }

  _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        pathFileImage = file.path;
        newBeat.thumbnail.image = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 80,
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Upload your new beat",
                              style: TextStyle(color: primary, fontSize: 28)),
                          Text("Uploading as admin",
                              style: TextStyle(color: primary, fontSize: 16)),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, color: primary)),
                    ],
                  ),
                ),
                'Title'.desc().marg(0, 0, 20),
                AppTextInputField.authVisibleInputText(
                  controller: _titleController,
                  hintText: "Enter beat's title",
                  outlineInputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inActiveColor),
                      borderRadius: BorderRadius.circular(8)),
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        newBeat.name = value;
                      });
                    }
                  },
                ).marg(0, 0, 6, 0),
                "Author's email".desc().marg(0, 0, 20),
                AppTextInputField.authVisibleInputText(
                  controller: _authorEmailController,
                  hintText: "Enter the author's email",
                  inputType: TextInputType.emailAddress,
                  outlineInputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inActiveColor),
                      borderRadius: BorderRadius.circular(8)),
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        newBeat.producer.email = value;
                      });
                    }
                  },
                ).marg(0, 0, 6, 0),
                "Author's name".desc().marg(0, 0, 20),
                AppTextInputField.authVisibleInputText(
                  controller: _authorNameController,
                  hintText: "Enter the author's name",
                  outlineInputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inActiveColor),
                      borderRadius: BorderRadius.circular(8)),
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        newBeat.producer.name = value;
                      });
                    }
                  },
                ).marg(0, 0, 6, 0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          "Type".desc().marg(0, 0, 20),
                          InkWell(
                            onTap: () async {
                              var result = await showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  animationType: DialogTransitionType.scale,
                                  builder: (BuildContext context) =>
                                      DialogTypeBeat());
                              if (result != null) {
                                final index = result as int;
                                setState(() {
                                  type = types[index]["name"];
                                  newBeat.type =
                                      TypeBeat.fromJson(types[index]);
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: inActiveColor),
                                  borderRadius: BorderRadius.circular(8)),
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(type ?? "Select type",
                                      style: TextStyle(
                                          color: type == null
                                              ? labelColor
                                              : mainColor)),
                                  Icon(Icons.expand_more, color: labelColor)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          "Upload date".desc().marg(0, 0, 20),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: inActiveColor),
                                borderRadius: BorderRadius.circular(8)),
                            margin: EdgeInsets.only(top: 8),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(uploadDate ?? "DD/MM/YYYY",
                                    style: TextStyle(color: labelColor)),
                                Icon(Icons.calendar_today_outlined,
                                    color: labelColor)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    "Import beat here".desc().marg(0, 0, 20),
                    InkWell(
                      onTap: () {
                        _pickFile();
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: inActiveColor),
                            borderRadius: BorderRadius.circular(8)),
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            pathFileBeat != null
                                ? "${pathFileBeat!.split('/').last}"
                                : "Wav or mp3",
                            style: TextStyle(color: labelColor)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    "Import image here".desc().marg(0, 0, 20),
                    InkWell(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border.all(color: inActiveColor),
                            borderRadius: BorderRadius.circular(8)),
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            pathFileImage != null
                                ? "${pathFileImage!.split('/').last}"
                                : "Png or img",
                            style: TextStyle(color: labelColor)),
                      ),
                    ),
                  ],
                ),
                'Description'.desc().marg(0, 0, 20),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        newBeat.description = value;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter description for your beat",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: inActiveColor),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                'Price'.desc().marg(0, 0, 20),
                AppTextInputField.authVisibleInputText(
                  controller: _priceController,
                  hintText: "Dollar",
                  inputType: TextInputType.number,
                  outlineInputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inActiveColor),
                      borderRadius: BorderRadius.circular(8)),
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        newBeat.price = double.parse(value);
                      });
                    }
                  },
                ).marg(0, 0, 6, 20),
                'Discount'.desc().marg(0, 0, 20),
                AppTextInputField.authVisibleInputText(
                  controller: _discountController,
                  hintText: "Dollar",
                  inputType: TextInputType.number,
                  outlineInputBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inActiveColor),
                      borderRadius: BorderRadius.circular(8)),
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {
                        newBeat.discount = double.parse(value);
                      });
                    }
                  },
                ).marg(0, 0, 6, 20),
                Container(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              checked1 = !checked1;
                            });
                          },
                          child: checked1
                              ? Icon(
                                  Icons.check_box,
                                  color: primary,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.crop_din,
                                  color: inActiveColor,
                                  size: 20,
                                )),
                      SizedBox(width: 10),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(color: mainColor, fontSize: 12)),
                          TextSpan(
                              text: "terms of services ",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                              text: "and ",
                              style: TextStyle(color: mainColor, fontSize: 12)),
                          TextSpan(
                              text: "privacy policy",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                        ])),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              checked2 = !checked2;
                            });
                          },
                          child: checked2
                              ? Icon(
                                  Icons.check_box,
                                  color: primary,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.crop_din,
                                  color: inActiveColor,
                                  size: 20,
                                )),
                      SizedBox(width: 10),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "I would like to receive weekly newsletters and promotion ",
                              style: TextStyle(color: mainColor, fontSize: 12)),
                        ])),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                BlocConsumer<BeatBloc, BeatState>(
                  listener: (context, state) {
                    if (state.uploadStatus == UploadStatus.complete) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    if (state.uploadStatus == UploadStatus.loading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return InkWell(
                      onTap: () {
                        if (checked1 && checked2) {
                          AppBloc.beatBloc.add(UploadBeat(newBeat));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              ExpandedSnackBar.failureSnackBar(context,
                                  "You miss the app terms! Please check it."));
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary),
                        alignment: Alignment.center,
                        child: Text("Upload",
                            style:
                                TextStyle(color: textBoxColor, fontSize: 18)),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30)
              ],
            )),
      ),
    );
  }
}
