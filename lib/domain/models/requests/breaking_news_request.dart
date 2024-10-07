import 'package:newsd/core/constants/nums.dart';
import 'package:newsd/core/constants/strings.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = breakingNewsPageSize,
  });
}
