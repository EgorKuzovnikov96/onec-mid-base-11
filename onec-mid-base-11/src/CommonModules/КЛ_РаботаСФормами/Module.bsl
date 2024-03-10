#Область ПрограммыйИнерфейс

Процедура ДополнитьФорму(Форма) Экспорт

	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтакноеЛицоВГруппуШапкаПраво(Форма);
		ДобавитьПолеСогласованнаяСкидка(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		 
		ДобавитьПолеКонтакноеЛицоВГруппуШапкаПраво(Форма);
	
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеВставитьКонтакноеЛицоВГруппуШапкаПраво(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеВставитьКонтакноеЛицоВГруппуШапкаПраво(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеКонтакноеЛицоВГруппуШапкаПраво(Форма);
	
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммыйИнтерфейс

Процедура ДобавитьПолеКонтакноеЛицоВГруппуШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтакноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.КЛ_КонтакноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяСкидка(Форма);
	
	ГруппаСогласованнаяСкидка = Форма.Элементы.Добавить("ГруппаСогласованнаяСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСогласованнаяСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСогласованнаяСкидка.Отображение = ОтображениеОбычнойГруппы.Нет;
	ГруппаСогласованнаяСкидка.ОтображатьЗаголовок = ЛОЖЬ; 
	ГруппаСогласованнаяСкидка.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;	

	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСогласованнаяСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.КЛ_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "СогласованнаяСкидкаПриИзменении");
	
	Команда = Форма.Команды.Добавить("Пересчитать");
	Команда.Заголовок = "Пересчитать";
	Команда.Действие = "Пересчитать";
	
	НовыйЭлемент = Форма.Элементы.Добавить("Пересчитать", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСогласованнаяСкидка);
	НовыйЭлемент.Заголовок = "Пересчитать";
	НовыйЭлемент.ИмяКоманды = "Пересчитать";
	
КонецПроцедуры

Процедура ДобавитьПолеВставитьКонтакноеЛицоВГруппуШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтакноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.КЛ_КонтакноеЛицо";

КонецПроцедуры

#КонецОбласти



