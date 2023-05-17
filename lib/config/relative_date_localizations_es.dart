import 'package:lit_relative_date_time/lit_relative_date_time.dart';

RelativeDateLocalization relativeDateLocalizationEs =
    const RelativeDateLocalization(
  languageCode: 'es',
  timeUnitsSingular: [
    'segundo',
    'minuto',
    'hora',
    'dia',
    'semana',
    'mes',
    'año',
  ],
  timeUnitsPlural: [
    'segundos',
    'minutos',
    'horas',
    'dias',
    'semanas',
    'meses',
    'años',
  ],
  prepositionPast: 'Hace',
  prepositionFuture: 'en',
  atTheMoment: 'ahora',
  formatOrderPast: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit,
  ],
  formatOrderFuture: [
    FormatComponent.preposition,
    FormatComponent.value,
    FormatComponent.unit,
  ],
);
