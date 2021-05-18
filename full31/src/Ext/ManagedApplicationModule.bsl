﻿Перем КД3_КэшМетаданных;

&После("ПередНачаломРаботыСистемы")
Процедура КД3_ПередНачаломРаботыСистемы()
	
	КД3_КэшМетаданных = Новый Соответствие;
	Настройки = КД3_Метаданные.ЗагрузитьНастройки();
	КД3_МетаданныеКлиент.СохранитьНастройкиВКэше(Настройки);
	
КонецПроцедуры

Функция КД3_Кэш() Экспорт
	Возврат КД3_КэшМетаданных;
КонецФункции

&После("ПередЗавершениемРаботыСистемы")
Процедура КД3_ПередЗавершениемРаботыСистемы(Отказ)
	
	// Каталоги обработчиков и архив исходников не удаляются по завершению работы
	Если КД3_Кэш()["КД3_Настройки_УдалятьВременныеФайлыПриЗакрытии"] Тогда
		Для Каждого КлючИЗначение Из КД3_КэшМетаданных Цикл
			Если КлючИЗначение.Ключ = "КаталогИсходников" Тогда
				УдалитьФайлы(КлючИЗначение.Значение);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры
