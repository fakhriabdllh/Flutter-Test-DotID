class SearchController {
  placesSearchController(String value, var placeList, var founded) {
    if (value.isEmpty) {
      founded = placeList;
    } else {
      founded = placeList
          .where((e) => e['title']
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()))
          .toList();
    }
  }
}
