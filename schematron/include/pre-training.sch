<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" name="Driver age constraints">
   <title>Проверка необходимого стажа управления</title>
   <annotation>
      <documentation>Получить права может водитель определенного возраста. Условия такие:</documentation>
   </annotation>
   <rule context="License/Categories/Category">
      <report test="Name = 'BE' and ( not ( preceding-sibling::Category[Name=('B') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()] or following-sibling::Category[Name=('B') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()]) )">Для получения категории "BE" водитель должен иметь право управления транспортными средствами категории "B" не менее 12 месяцев</report>
      <report test="Name = 'C1E' and ( not ( preceding-sibling::Category[Name=('C1') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()] or following-sibling::Category[Name=('C1') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()]) )">Для получения категории "C1E" водитель должен иметь право управления транспортными средствами категории "C1" не менее 12 месяцев</report>
      <report test="Name = 'CE' and ( not ( preceding-sibling::Category[Name=('C') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()] or following-sibling::Category[Name=('C') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()]) )">Для получения категории "CE" водитель должен иметь право управления транспортными средствами категории "C" не менее 12 месяцев</report>
      <report test="Name = 'DE' and ( not ( preceding-sibling::Category[Name=('D') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()] or following-sibling::Category[Name=('D') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()]) )">Для получения категории "DE" водитель должен иметь право управления транспортными средствами категории "D" не менее 12 месяцев</report>
      <report test="Name = 'D1E' and ( not ( preceding-sibling::Category[Name=('D1') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()] or following-sibling::Category[Name=('D1') and xs:yearMonthDuration('P0Y12M')+xs:date(IssueDate) &lt; current-date()]) )">Для получения категории "D1E" водитель должен иметь право управления транспортными средствами категории "D1" не менее 12 месяцев</report>
   </rule>
</pattern>
