import 'package:newsd/src/utils/constants/nums.dart';
import 'package:newsd/src/utils/constants/strings.dart';

class NewsRequest {
  final String apiKey;
  final String q;
  final String searchIn;
  final String sortBy;
  final int page;
  final int pageSize;

  NewsRequest({
    this.apiKey = defaultApiKey,
    this.q = 'All',
    this.searchIn = 'description',
    this.sortBy = 'relevancy',
    this.page = 1,
    this.pageSize = newsPageSize,
  });
}
