<?xml version="1.0" encoding="UTF-8"?>
<sch:schema queryBinding="xslt2"
			xmlns:sch="http://purl.oclc.org/dsdl/schematron"
			xmlns:db="http://docbook.org/ns/docbook"
			xmlns:xi="http://www.w3.org/2001/XInclude">

	<sch:include href="include/age_restriction.sch"/>
	<sch:include href="include/enumerate_categories.sch"/>
	<sch:include href="include/pre-training.sch"/>

	<!-- Include for create doc-->
	<xi:include href="include/age_restriction.sch"/>
	<xi:include href="include/enumerate_categories.sch"/>
	<xi:include href="include/pre-training.sch"/>

	<sch:title>Проверка водительских удостоверений, выданных в РФ</sch:title>

	<sch:pattern name="Format">
		<sch:title>Проверка корректности форматов</sch:title>

		<sch:annotation>
			<sch:documentation>Осуществление форматного контроля</sch:documentation>
		</sch:annotation>

		<sch:rule context="License">

			<sch:title>Проверка формата серии и номера удостоверения</sch:title>

			<sch:annotation>
				<sch:documentation>Серия документа. Две цифры и две русские заглавные буквы для водительского удостоверения, полученного до 1 марта 2011 г., или четыре цифры для водительского удостоверения, полученного после 1 марта 2011. Пример: 44АА или 4403</sch:documentation>
			</sch:annotation>

			<sch:report test="(xs:date('2011-03-01') > xs:date(IssueDate)) and not(matches(Series, '^[1-9]{2}[0-9]{2}$'))">Серия водительского удостоверия, выданного до 1 марта 2011 г, должна содержать четыре цифры</sch:report>
			<sch:report test="(xs:date(IssueDate) >= xs:date('2011-03-01')) and not(matches(Series, '^[1-9]{2}[А-Я]{2}$'))">Серия водительского удостоверения, выданного после 1 марта 2011 г., должна содержать две цифры и две буквы кириллицы</sch:report>
		</sch:rule>

		<sch:rule context="License/Driver">

			<sch:title>Проверка формата ФИО</sch:title>

			<sch:assert test="not(matches(Surname, '[ ]{2,}|[`]{2,}|[.]{2,}|[\-]{2,}|[^а-яА-ЯёЁъ\-.` ()]|^[\- `.]|[\- `.]$|^\w\.'))" role="ERROR">В фамилии водителя обнаружены недопустимые символы </sch:assert>
			<sch:assert test="not(matches(Name, '[ ]{2,}|[`]{2,}|[.]{2,}|[\-]{2,}|[^а-яА-ЯёЁъ\-.` ()]|^[\- `.]|[\- `.]$|^\w\.'))" role="ERROR">В имени водителя обнаружены недопустимые символы </sch:assert>
			<sch:assert test="not(matches(Patronymic, '[ ]{2,}|[`]{2,}|[.]{2,}|[\-]{2,}|[^а-яА-ЯёЁъ\-.` ()]|^[\- `.]|[\- `.]$|^\w\.'))" role="ERROR">В отчестве водителя обнаружены недопустимые символы </sch:assert>

			<sch:report test="Surname='' or Name=''" role="ERROR">Не указана фамилия или имя водителя</sch:report>
			<sch:report test="Patronymic='' or not(Patronymic)" role="WARNING">Не указано отчество водителя</sch:report>

		</sch:rule>
	</sch:pattern>

	<sch:pattern name="Date">
		<sch:title>Проверка корректности дат</sch:title>

		<sch:annotation>
			<sch:documentation>Проверка корректности даты выдачи и даты окончания действия водительского удостоверения</sch:documentation>
		</sch:annotation>

		<sch:rule context="License">
			<sch:title>Начало и окончание действия удостоверения</sch:title>
			<sch:assert test="xs:date(current-date()) >= xs:date(IssueDate)">Дата выдачи документа не должна быть больше текущей даты</sch:assert>
			<sch:assert test="xs:date(ExpDate) = xs:yearMonthDuration('P10Y')+xs:date(IssueDate)" role="WARNING">Удостоверение должно быть выдано на 10 лет</sch:assert>
		</sch:rule>

		<sch:rule context="License/Categories/Category">
			<sch:title>Начало и окончание действия категории</sch:title>

			<sch:assert test="xs:date(current-date()) >= xs:date(IssueDate)">Дата начала действия категории не должна быть больше текущей даты</sch:assert>
			<sch:assert test="xs:date(../../ExpDate) >= xs:date(ExpDate)">Срок действия категории не может превышать срок действия удостоверения</sch:assert>
		</sch:rule>
	</sch:pattern>

	<sch:pattern name="Dublicate">
		<sch:title>Проверка на уникальность удостоверения (в границах файла) и категории ТС (в границах удостоверения)</sch:title>

		<sch:rule context="License">
			<sch:title>Проверка удостоверений</sch:title>

			<sch:let name="SeriesNumber" value="string-join((Series,Number),' ')"/>
			<sch:assert test="count(Series[$SeriesNumber = ../preceding-sibling::License/string-join((Series, Number), ' ')])=0" role="FATAL" >Удостоверение <sch:value-of select="$SeriesNumber"/> повторяется</sch:assert>
		</sch:rule>

		<sch:rule context="Categories/Category">
			<sch:title>Проверка категорий</sch:title>

			<sch:assert test="count(Name[. = ../preceding-sibling::Category/Name])=0" role="ERROR" >Категория "<sch:value-of select="Name"/>" указана в удостоверении несколько раз</sch:assert>
		</sch:rule>

	</sch:pattern>

</sch:schema>
