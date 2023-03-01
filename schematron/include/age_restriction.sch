<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" name="Driver age constraints">
   <title>Проверка ограничений по возрасту</title>
   <annotation>
      <documentation>Получить права может водитель определенного возраста. Условия такие:</documentation>
   </annotation>
   <rule context="License/Driver">
      <let name="DriverAge"
            value="floor(days-from-duration(current-date()-xs:date(DateOfBirth)) div 365.25)"/>
      <report test="$DriverAge &lt; 16 and ../Categories/Category/Name = ('M','A1')"
               role="ERROR">В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше 16 лет</report>
      <report test="$DriverAge &lt; 18 and ../Categories/Category/Name = ('A','B','B1','C','C1')"
               role="ERROR">В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше 18 лет</report>
      <report test="$DriverAge &lt; 19 and ../Categories/Category/Name = ('BE','C1E','CE')"
               role="ERROR">В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше 19 лет</report>
      <report test="$DriverAge &lt; 21 and ../Categories/Category/Name = ('D','D1','Tm','Tb')"
               role="ERROR">В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше 21 лет</report>
      <report test="$DriverAge &lt; 22 and ../Categories/Category/Name = ('DE','D1E')"
               role="ERROR">В удостоверении указаны категории ТС, для управления которыми водитель должен быть старше 22 лет</report>
   </rule>
</pattern>
