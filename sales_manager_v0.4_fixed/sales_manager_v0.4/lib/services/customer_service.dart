import 'supabase_service.dart';

class CustomerService {
  static Future<List<Map<String, dynamic>>> list(String businessId) async {
    final c = SupabaseService.client;
    if (c == null) return [];
    final result = await c.from('customers')
        .select('id,name,phone,address,balance,credit_limit')
        .eq('business_id', businessId)
        .order('name');
    return List<Map<String, dynamic>>.from(result);
  }

  static Future<void> add({
    required String businessId,
    required String name,
    String? phone,
  }) async {
    final c = SupabaseService.client;
    if (c == null) throw StateError('Cloud backend is not configured.');
    await c.from('customers').insert({
      'business_id': businessId,
      'name': name.trim(),
      'phone': phone?.trim().isEmpty == true ? null : phone?.trim(),
    });
  }
}
