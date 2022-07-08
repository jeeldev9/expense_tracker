import 'package:budget_tracker_ui/controller/expense_controller.dart';
import 'package:budget_tracker_ui/json/create_budget_json.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  int activeCategory = 0;
  TextEditingController _budgetName =
      TextEditingController(text: "");
  TextEditingController _budgetPrice = TextEditingController(text: "");

  ExpenseController expenseController;
  @override
  void initState() {
    expenseController=Get.put(ExpenseController());
    expenseController.getCategoryList();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: SafeArea(
              child: GetBuilder<ExpenseController>(
                  id: 'getExpenseCategory',
                  init:expenseController,
                  builder: (value) {
                    return expenseController.isApiCalling?Container(height:size.height,child: Center(child: CircularProgressIndicator(),)):Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(color: white, boxShadow: [
                        //     BoxShadow(
                        //       color: grey.withOpacity(0.01),
                        //       spreadRadius: 10,
                        //       blurRadius: 3,
                        //       // changes position of shadow
                        //     ),
                        //   ]),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         top: 60, right: 20, left: 20, bottom: 25),
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Create budget",
                        //               style: TextStyle(
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold,
                        //                   color: black),
                        //             ),
                        //             Row(
                        //               children: [Icon(AntDesign.search1)],
                        //             )
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: Text(
                            "Choose category",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          width: size.width,
                          child: Wrap(
                            runSpacing: 15,
                            alignment: WrapAlignment.start,
                            children:List.generate(expenseController.expenseCategoryList.length, (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeCategory = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 8,
                                  ),
                                  width: size.width*0.25,
                                  height: size.height*0.15,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(
                                          width: 2,
                                          color: activeCategory == index
                                              ? primary
                                              : Colors.transparent),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.01),
                                          spreadRadius: 10,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 25, top: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: grey.withOpacity(0.15)),
                                            child: Center(
                                              child: Image.asset(
                                                categories[index]['icon'],
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.contain,
                                              ),
                                            )),
                                        Text(
                                          expenseController.expenseCategoryList[index].categoryName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expense title",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              TextField(
                                controller: _budgetName,
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold, color: black),
                                decoration: InputDecoration(
                                    hintText: "Enter Title", border: InputBorder.none),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (size.width - 140),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Enter Expense Amount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xff67727d)),
                                        ),
                                        TextField(
                                          controller: _budgetPrice,
                                          cursorColor: black,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: black),
                                          decoration: InputDecoration(
                                              hintText: "Enter Amount",
                                              border: InputBorder.none),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
              ),
            ),
          );
        }
      ),
    );
  }


}
