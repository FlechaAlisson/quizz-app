class Formater {
  static String formateDate(String date) {
    String aux = date.substring(0, 10);

    List<String> listAux = aux.split('-');

    return '${listAux[2]}/${listAux[1]}/${listAux[0]}';
  }
}
