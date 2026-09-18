import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../widgets/stat_card.dart';
import '../config/app_config.dart';

class DashboardPage extends StatelessWidget {
  final String? businessId;
  const DashboardPage({super.key, this.businessId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _header(),
        const SizedBox(height: 22),
        LayoutBuilder(builder: (context, c) {
          final n = c.maxWidth > 1100 ? 4 : c.maxWidth > 700 ? 2 : 1;
          return GridView.count(
            crossAxisCount: n, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 2.6,
            children: const [
              StatCard(title:'مبيعات اليوم', value:'12,450 ج', change:'↑ 16% من أمس', icon:Icons.payments_rounded),
              StatCard(title:'إجمالي الطلبات', value:'42', change:'↑ 8% هذا الأسبوع', icon:Icons.shopping_bag_rounded),
              StatCard(title:'العملاء', value:'128', change:'+12 عميل جديد', icon:Icons.people_alt_rounded),
              StatCard(title:'صافي الربح', value:'3,560 ج', change:'↑ 11% هذا الشهر', icon:Icons.trending_up_rounded),
            ],
          );
        }),
        const SizedBox(height: 18),
        LayoutBuilder(builder: (context, c) {
          if (c.maxWidth < 800) {
            return Column(children: [_salesChart(), const SizedBox(height: 18), _quickActions()]);
          }
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(flex: 2, child: _salesChart()),
            const SizedBox(width: 18),
            Expanded(child: _quickActions()),
          ]);
        }),
        const SizedBox(height: 18),
        _recentSales(),
      ]),
    );
  }

  Widget _header() => Row(children: [
    const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('لوحة التحكم', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
      SizedBox(height: 6),
      Text('نظرة سريعة على أداء نشاطك اليوم', style: TextStyle(color: AppTheme.muted)),
    ])),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: AppTheme.panel, borderRadius: BorderRadius.circular(14)),
      child: Row(children: [
        Icon(Icons.cloud_done_rounded, color: AppConfig.cloudEnabled ? Colors.lightGreenAccent : Colors.orangeAccent, size: 18),
        const SizedBox(width: 7), const Text('متصل ومتزامن', style: TextStyle(fontSize: 12))
      ]),
    )
  ]);

  Widget _salesChart() => Container(
    height: 330, padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppTheme.panel, borderRadius: BorderRadius.circular(22)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('المبيعات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 4),
      const Text('آخر 7 أيام', style: TextStyle(color: AppTheme.muted, fontSize: 12)),
      const SizedBox(height: 18),
      Expanded(child: LineChart(LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 34)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 26)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [LineChartBarData(
          isCurved: true, barWidth: 4,
          dotData: const FlDotData(show: false),
          spots: const [
            FlSpot(0, 1200), FlSpot(1, 1450), FlSpot(2, 1300),
            FlSpot(3, 1700), FlSpot(4, 1450), FlSpot(5, 1500), FlSpot(6, 1850)
          ],
        )],
      )))
    ]),
  );

  Widget _quickActions() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppTheme.panel, borderRadius: BorderRadius.circular(22)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('إجراءات سريعة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 16),
      _action(Icons.add_shopping_cart_rounded, 'بيع جديد'),
      _action(Icons.add_box_rounded, 'إضافة منتج'),
      _action(Icons.person_add_alt_1_rounded, 'إضافة عميل'),
      _action(Icons.receipt_long_rounded, 'الفواتير'),
    ]),
  );

  Widget _action(IconData icon, String text) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: AppTheme.panel2.withOpacity(.65), borderRadius: BorderRadius.circular(14)),
    child: Row(children: [
      Icon(icon, color: AppTheme.primary), const SizedBox(width: 12),
      Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      const Spacer(), const Icon(Icons.chevron_right_rounded, color: AppTheme.muted)
    ]),
  );

  Widget _recentSales() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppTheme.panel, borderRadius: BorderRadius.circular(22)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [
        Text('آخر المبيعات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        Spacer(), Text('عرض الكل', style: TextStyle(color: AppTheme.primary))
      ]),
      const SizedBox(height: 15),
      ...[
        ('#1043','أحمد محمد','640 ج','نقدي'),
        ('#1042','سارة علي','320 ج','بطاقة'),
        ('#1041','خالد حسن','180 ج','نقدي'),
        ('#1040','فاطمة جمال','870 ج','آجل'),
      ].map((x) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(backgroundColor: AppTheme.primary.withOpacity(.12), child: const Icon(Icons.receipt, color: AppTheme.primary)),
        title: Text('${x.$1}  •  ${x.$2}'),
        subtitle: Text(x.$4, style: const TextStyle(color: AppTheme.muted)),
        trailing: Text(x.$3, style: const TextStyle(fontWeight: FontWeight.w800)),
      )),
    ]),
  );
}
