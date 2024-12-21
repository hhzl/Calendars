'From Cuis7.3 [latest update: #6907] on 21 December 2024 at 10:21:45 pm'!
'Description '!
!provides: 'Calendarium-Data' 1 0!
SystemOrganization addCategory: #'Calendarium-Data'!


!classDefinition: #CalData category: #'Calendarium-Data'!
Object subclass: #CalData
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarium-Data'!
!classDefinition: 'CalData class' category: #'Calendarium-Data'!
CalData class
	instanceVariableNames: ''!

!classDefinition: #CalCalendar category: #'Calendarium-Data'!
CalData subclass: #CalCalendar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarium-Data'!
!classDefinition: 'CalCalendar class' category: #'Calendarium-Data'!
CalCalendar class
	instanceVariableNames: ''!

!classDefinition: #CalMonths category: #'Calendarium-Data'!
CalData subclass: #CalMonths
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarium-Data'!
!classDefinition: 'CalMonths class' category: #'Calendarium-Data'!
CalMonths class
	instanceVariableNames: ''!

!classDefinition: #CalWeekDays category: #'Calendarium-Data'!
CalData subclass: #CalWeekDays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarium-Data'!
!classDefinition: 'CalWeekDays class' category: #'Calendarium-Data'!
CalWeekDays class
	instanceVariableNames: ''!


!CalData commentStamp: 'hjh 12/7/2024 08:17:48' prior: 0!
This class keeps static calender data such as day names and month names in different languages.

Source: https://github.com/fccm/ocaml-cal-svg/blob/master/cal_svg12.ml

Ocaml data structure was

let cal_lang = [
  "en", "calendar";
  "fr", "calendrier";
  "de", "Kalender";
  "es", "calendario";
  "it", "calendario";
  "nl", "kalender";
  "da", "kalender";
  "id", "kalendar";
  "pt", "calendário";
  "no", "kalender";
  "sl", "koledar";
  "uk", "календар";
  "ru", "календарь";
]!

!CalData class methodsFor: 'accessing - maps' stamp: 'hjh 12/7/2024 08:14:29'!
mapLanguageAbreviations
	^ Dictionary newFromPairs:
		{'de'. 'German'. 
		'es'. 'Spanish'. 
		'it'. 'Italian'. 
		'nl'. 'Dutch'. 
		'da'. 'Danish'. 
		'id'. 'Indonesian'. 
		'pt'. 'Portuguese'. 
		'no'. 'Norwegian'. 
		'sl'. 'Slovenian'. 
		'uk'. 'Ukrainian'. 
		'ru'. 'Russian'. 
		'en'. 'English'. 
		'fr'. 'French'}.! !

!CalData class methodsFor: 'accessing - maps' stamp: 'hjh 12/8/2024 14:26:22'!
mapNames

self subclassResponsibility! !

!CalData class methodsFor: 'support' stamp: 'hjh 12/8/2024 14:23:00'!
namesForLanguage: aLanguageAbbreviation
^ self mapNames at: aLanguageAbbreviation! !

!CalData class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:25:14'!
monthNameAt: anInteger langAbbrev: alanguageAbbreviation
"
self monthNameAt: 1 langAbbrev: 'en'
self monthNameAt: 12 langAbbrev: 'fr'
"
	^ (CalMonths namesForLanguage: alanguageAbbreviation) at: anInteger! !

!CalData class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:27:50'!
weekdayNameAbbrevAt: anInteger langAbbrev: alanguageAbbreviation
"
self weekdayNameAbbrevAt: 1 langAbbrev: 'en'

self weekdayNameAbbrevAt: 1 langAbbrev: 'de'
"
	^ (CalWeekDays namesAbbrevForLanguage: alanguageAbbreviation) at: anInteger! !

!CalData class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:24:34'!
weekdayNameAt: anInteger langAbbrev: alanguageAbbreviation
"
self weekdayNameAt: 1 langAbbrev: 'en'

self weekdayNameAt: 1 langAbbrev: 'de'
"
	^ (CalWeekDays namesForLanguage: alanguageAbbreviation) at: anInteger! !

!CalCalendar class methodsFor: 'as yet unclassified' stamp: 'hjh 12/8/2024 14:10:56'!
mapCalendar
	^ Dictionary newFromPairs: {
  'en' . 'calendar' .
  'fr' . 'calendrier' .
  'de' . 'Kalender' .
  'es' . 'calendario' .
  'it' . 'calendario' .
  'nl' . 'kalender' .
  'da' . 'kalender' .
  'id' . 'kalendar' .
  'pt' . 'calendário' .
  'no' . 'kalender' .
  'sl' . 'koledar' .
  'uk' . 'календар' .
  'ru' . 'календарь' .
}! !

!CalMonths class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:09:34'!
mapMonthNames
^ Dictionary newFromPairs: {
  'en' . {'January' . 'February' . 'March' . 'April' . 'May' . 'June' . 'July' . 'August' . 'September' . 'October' . 'November' . 'December'} .
  'fr' . {'janvier' . 'février' . 'mars' . 'avril' . 'mai' . 'juin' . 'juillet' . 'août' . 'septembre' . 'octobre' . 'novembre' . 'décembre'} .
  'de' . {'Januar' . 'Februar' . 'März' . 'April' . 'Mai' . 'Juni' . 'Juli' . 'August' . 'September' . 'Oktober' . 'November' . 'Dezember'} .
  'es' . {'enero' . 'febrero' . 'marzo' . 'abril' . 'mayo' . 'junio' . 'julio' . 'agosto' . 'septiembre' . 'octubre' . 'noviembre' . 'diciembre'} .
  'it' . {'gennaio' . 'febbraio' . 'marzo' . 'aprile' . 'maggio' . 'giugno' . 'luglio' . 'agosto' . 'settembre' . 'ottobre' . 'novembre' . 'dicembre'} .
  'nl' . {'januari' . 'februari' . 'maart' . 'april' . 'mei' . 'juni' . 'juli' . 'augustus' . 'september' . 'oktober' . 'november' . 'december'} .
  'da' . {'januar' . 'februar' . 'marts' . 'april' . 'maj' . 'juni' . 'juli' . 'august' . 'september' . 'oktober' . 'november' . 'december'} .
  'id' . {'Januari' . 'Februari' . 'Maret' . 'April' . 'Mei' . 'Juni' . 'Juli' . 'Agustus' . 'September' . 'Oktober' . 'November' . 'Desember'} .
  'pt' . {'janeiro' . 'fevereiro' . 'março' . 'abril' . 'maio' . 'junho' . 'julho' . 'agosto' . 'setembro' . 'outubro' . 'novembro' . 'dezembro'} .
  'no' . {'januar' . 'februar' . 'mars' . 'april' . 'mai' . 'juni' . 'juli' . 'august' . 'september' . 'oktober' . 'november' . 'desember'} .
  'sl' . {'januar' . 'februar' . 'marec' . 'april' . 'maj' . 'junij' . 'julij' . 'avgust' . 'september' . 'oktober' . 'november' . 'december'} .
  'uk' . {'січня' . 'лютого' . 'березня' . 'квітня' . 'травня' . 'червня' . 'липня' . 'серпня' . 'вересня' . 'жовтня' . 'листопада' . 'грудня'} .
  'ru' . {'январь' . 'февраль' . 'март' . 'апрель' . 'май' . 'июнь' . 'июль' . 'август' . 'сентябрь' . 'октябрь' . 'ноябрь' . 'декабрь'} .
}
! !

!CalMonths class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:15:58'!
namesForLanguage: aLanguageAbbreviation
^ self mapMonthNames at: aLanguageAbbreviation! !

!CalWeekDays class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:23:33'!
mapAbbreviations
"days_abbr_lang"
^ Dictionary newFromPairs: {
  'en' . {'Mon' . 'Tue' . 'Wed' . 'Thu' . 'Fri' . 'Sat' . 'Sun'} .
  'fr' . {'lun' . 'mar' . 'mer' . 'jeu' . 'ven' . 'sam' . 'dim'} .
  'de' . {'Mo' . 'Di' . 'Mi' . 'Do' . 'Fr' . 'Sa' . 'So'} .
  'es' . {'lun' . 'mar' . 'mié' . 'jue' . 'vie' . 'sáb' . 'dom'} .
  'it' . {'lun' . 'mar' . 'mer' . 'gio' . 'ven' . 'sab' . 'dom'} .
  'nl' . {'ma' . 'di' . 'wo' . 'do' . 'vr' . 'za' . 'zo'} .
  'da' . {'man' . 'tir' . 'ons' . 'tor' . 'fre' . 'lør' . 'søn'} .
  'id' . {'Sen' . 'Sel' . 'Rab' . 'Kam' . 'Jum' . 'Sab' . 'Min'} .
  'pt' . {'seg' . 'ter' . 'qua' . 'qui' . 'sex' . 'sáb' . 'dom'} .
  'no' . {'man' . 'tir' . 'ons' . 'tor' . 'fre' . 'lør' . 'søn'} .
  'sl' . {'pon' . 'tor' . 'sre' . 'čet' . 'pet' . 'sob' . 'ned'} .
  'uk' . {'пн' . 'вт' . 'ср' . 'чт' . 'пт' . 'сб' . 'нд'} .
  'ru' . {'пн' . 'вт' . 'ср' . 'чт' . 'пт' . 'сб' . 'вс'} .
}! !

!CalWeekDays class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:21:46'!
mapNames
^ Dictionary newFromPairs: {
  'en' . {'Monday' . 'Tuesday' . 'Wednesday' . 'Thursday' . 'Friday' . 'Saturday' . 'Sunday'} .
  'fr' . {'lundi' . 'mardi' . 'mercredi' . 'jeudi' . 'vendredi' . 'samedi' . 'dimanche'} .
  'de' . {'Montag' . 'Dienstag' . 'Mittwoch' . 'Donnerstag' . 'Freitag' . 'Samstag' . 'Sonntag'} .
  'es' . {'lunes' . 'martes' . 'miércoles' . 'jueves' . 'viernes' . 'sábado' . 'domingo'} .
  'it' . {'lunedì' . 'martedì' . 'mercoledì' . 'giovedì' . 'venerdì' . 'sabato' . 'domenica'} .
  'nl' . {'maandag' . 'dinsdag' . 'woensdag' . 'donderdag' . 'vrijdag' . 'zaterdag' . 'zondag'} .
  'da' . {'mandag' . 'tirsdag' . 'onsdag' . 'torsdag' . 'fredag' . 'lørdag' . 'søndag'} .
  'id' . {'Senin' . 'Selasa' . 'Rabu' . 'Kamis' . 'Jumat' . 'Sabtu' . 'Minggu'} .
  'pt' . {'segunda-feira' . 'terça-feira' . 'quarta-feira' . 'quinta-feira' . 'sexta-feira' . 'sábado' . 'domingo'} .
  'no' . {'mandag' . 'tirsdag' . 'onsdag' . 'torsdag' . 'fredag' . 'lørdag' . 'søndag'} .
  'sl' . {'ponedeljek' . 'torek' . 'sreda' . 'četrtek' . 'petek' . 'sobota' . 'nedelja'} .
  'uk' . {'понеділок' . 'вівторок' . 'середа' . 'четвер' . 'пʼятниця' . 'субота' . 'неділя'} .
  'ru' . {'понедельник' . 'вторник' . 'среда' . 'четверг' . 'пятница' . 'суббота' . 'воскресенье'} .
}
! !

!CalWeekDays class methodsFor: 'accessing' stamp: 'hjh 12/8/2024 14:29:08'!
namesAbbrevForLanguage: aLanguageAbbreviation

^self mapAbbreviations at: aLanguageAbbreviation

! !
