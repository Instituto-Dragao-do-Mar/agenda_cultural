extension Eventos on String{
  int? getIdTipoEvento(){
    int? id;
    this == "Ocorrência" ? id = 1 : null;
    this == "Despesa" ? id = 2 : null;
    this == "Check-In" ? id = 3 : null;
    this == "Check-Out" ? id = 4 : null;
    return id;
  }
}