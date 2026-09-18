import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomersPage extends StatelessWidget {
  final String? businessId;
  const CustomersPage({super.key, this.businessId});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Row(children:[
        const Expanded(child:Text('العملاء والحسابات',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900))),
        FilledButton.icon(onPressed:(){},icon:const Icon(Icons.person_add),label:const Text('إضافة عميل'))
      ]),
      const SizedBox(height:20),
      Expanded(child:ListView.separated(
        itemCount:8,separatorBuilder:(_,__)=>const SizedBox(height:8),
        itemBuilder:(_,i)=>Container(
          padding:const EdgeInsets.all(16),
          decoration:BoxDecoration(color:AppTheme.panel,borderRadius:BorderRadius.circular(17)),
          child:Row(children:[
            CircleAvatar(backgroundColor:AppTheme.accent.withOpacity(.18),child:Text('${i+1}')),
            const SizedBox(width:12),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Text(['أحمد محمد','سارة علي','خالد حسن','فاطمة جمال','محمد سمير','عمر إبراهيم','نور أحمد','محمود سعيد'][i],style:const TextStyle(fontWeight:FontWeight.w800)),
              const Text('0100 123 4567',style:TextStyle(color:AppTheme.muted,fontSize:12))
            ])),
            Text(i.isEven?'له 1,250 ج':'عليه 420 ج',style:TextStyle(color:i.isEven?Colors.lightGreenAccent:Colors.orangeAccent,fontWeight:FontWeight.w700))
          ])
        )
      ))
    ])
  );
}
