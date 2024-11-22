import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';

Future<void> sortEvents(List<Event> events) async {
  // Ordena os eventos na lista com base nas datas de início e fim.
  events.sort((a, b) {
    // Obtém a data e hora inicial do primeiro evento de cada lista.
    var dateTimeA = a.eventosdatas?.first.datahora;
    var dateTimeB = b.eventosdatas?.first.datahora;

    // Converte as strings para objetos DateTime locais.
    var dateA = DateTime.parse(dateTimeA!).toLocal();
    var dateB = DateTime.parse(dateTimeB!).toLocal();

    // Compara as datas (ano, mês e dia) sem considerar horas.
    var compareResultado = DateTime(dateA.year, dateA.month, dateA.day).compareTo(
      DateTime(dateB.year, dateB.month, dateB.day),
    );

    // Se as datas forem diferentes, retorna o resultado da comparação.
    if (compareResultado != 0) {
      return compareResultado;
    }

    // Se as datas forem iguais, obtém a data de fim para desempate.
    var dateFinishA = a.eventosdatas?.first.datafim ?? a.eventosdatas?.first.datainicio;
    var dateFinishB = b.eventosdatas?.first.datafim ?? b.eventosdatas?.first.datainicio;

    // Calcula os dias restantes até o fim para cada evento.
    var diasParaFimA = calculateDaysToFinish(dateFinishA, dateTimeA);
    var diasParaFimB = calculateDaysToFinish(dateFinishB, dateTimeB);

    // Compara os dias restantes e retorna o resultado.
    return diasParaFimA.compareTo(diasParaFimB);
  });
}

int calculateDaysToFinish(String? dataFim, String? dataInicio) {
  // Se a data de fim for válida, calcula os dias restantes.
  if (dataFim != null && dataInicio != null) {
    var dateFinishDateTime = DateTime.parse(dataFim);
    var dateInitialDateTime = DateTime.parse(dataInicio);
    // Calcula a diferença em dias entre as datas.
    var daysForFinish = dateFinishDateTime.difference(dateInitialDateTime).inDays;
    return daysForFinish;
  }
  // Se as datas não forem válidas, retorna 0.
  return 0;
}