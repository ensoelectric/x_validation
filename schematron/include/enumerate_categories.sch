<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" name="Enumerate of categories">
   <title>Проверка существования категории</title>
   <rule context="License/Categories/Category">
      <assert test="Name = ('M','A','A1','B','B1','BE','C','C1','C1E','CE','D','DE','D1','D1E','Tm','Tb')"
               role="ERROR">
         <value-of select="Name"/> - не является категорией ТС</assert>
   </rule>
</pattern>
