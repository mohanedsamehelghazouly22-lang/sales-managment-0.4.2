import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReportsPage extends StatelessWidget {
  final String? businessId;
  const ReportsPage({super.key, this.businessId});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      const Text('التقارير والتحليلات',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900)),
      const SizedBox(height:6),
      const Text('تقارير المبيعات والأرباح والمخزون والعملاء',style:TextStyle(color:AppTheme.muted)),
      const SizedBox(height:24),
      Expanded(child:GridView.count(
        crossAxisCount:MediaQuery.sizeOf(context).width>900?3:1,
        crossAxisSpacing:14,mainAxisSpacing:14,
        children:[
          _card(Icons.payments_rounded,'تقرير المبيعات','اليومي • الأسبوعي • الشهري'),
          _card(Icons.trending_up_rounded,'تقرير الأرباح','المبيعات - التكلفة - المصروفات'),
          _card(Icons.inventory_2_rounded,'تقرير المخزون','حركة الأصناف والتنبيهات'),
          _card(Icons.people_alt_rounded,'تقرير العملاء','المشتريات والمديونيات'),
          _card(Icons.shopping_cart_rounded,'تقرير المشتريات','الموردون وفواتير الشراء'),
          _card(Icons.receipt_long_rounded,'تقرير المصروفات','حسب التصنيف والفترة'),
        ]
      ))
    ])
  );

  Widget _card(IconData icon,String title,String sub)=>Container(
    padding:const EdgeInsets.all(22),
    decoration:BoxDecoration(color:AppTheme.panel,borderRadius:BorderRadius.circular(20)),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Container(width:50,height:50,decoration:BoxDecoration(color:AppTheme.primary.withOpacity(.12),borderRadius:BorderRadius.circular(15)),child:Icon(icon,color:AppTheme.primary)),
      const Spacer(),Text(title,style:const TextStyle(fontSize:18,fontWeight:FontWeight.w800)),
      const SizedBox(height:5),Text(sub,style:const TextStyle(color:AppTheme.muted,fontSize:12)),
      const SizedBox(height:10),const Row(children:[Text('فتح التقرير',style:TextStyle(color:AppTheme.primary)),Icon(Icons.arrow_forward_ios,size:13,color:AppTheme.primary)])
    ])
  );
}
