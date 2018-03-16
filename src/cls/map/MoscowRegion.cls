Class map.MoscowRegion Extends (%Persistent, %XML.Adaptor)
{

Index idIndex On id [ IdKey, PrimaryKey, Unique ];

/// Код
Property id As %String [ Required ];

/// Название админ. единицы
Property name As %String(MAXLEN = 250);

/// Площадь, га
Property area As %Integer;

/// Население
Property population As %Integer;

/// Название вышестоящей адм. единицы
Property parentName As %String;

/// Вышестоящая адм. единица
Property parent As map.MoscowRegion;

/// Вышестоящая адм. единица
Property parentId As %Integer;

ClassMethod populateRegions() As %Status
{
	#dim sc As %Status = $$$OK
	#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId(..%ClassName(1) _ "||" _ "regions").Data
	#dim reader As %XML.Reader = ##class(%XML.Reader).%New()

	set sc = ..%KillExtent()
	if $$$ISERR(sc) quit sc

	set sc = reader.OpenStream(stream, "literal")
	if $$$ISERR(sc) quit sc
	
	do reader.Correlate("region", ..%ClassName(1))
	
	#dim obj As map.MoscowRegion
	while reader.Next(.obj, .sc)
	{
		if $$$ISERR(sc) quit

		if (obj.parentId) {
			set obj.parent = ..%OpenId(obj.parentId)
		}

		set sc = obj.%Save()
		if $$$ISERR(sc) quit
		
		set obj = ""
	}
	
	quit sc
}

XData regions
{
<regions>
		<region>
			<name>Центральный округ</name>
			<area>6618</area>
			<population>696563</population>
			<parentName>-</parentName>
			<id>1001</id>
		</region>
		<region>
			<name>Северный округ</name>
			<area>11372</area>
			<population>1112875</population>
			<parentName>-</parentName>
			<id>1002</id>
		</region>
		<region>
			<name>Северо-Восточный округ</name>
			<area>10188</area>
			<population>1249384</population>
			<parentName>-</parentName>
			<id>1003</id>
		</region>
		<region>
			<name>Северо-Западный округ</name>
			<area>9328</area>
			<population>805391</population>
			<parentName>-</parentName>
			<id>1004</id>
		</region>
		<region>
			<name>Западный округ</name>
			<area>15303</area>
			<population>1098482</population>
			<parentName>-</parentName>
			<id>1005</id>
		</region>
		<region>
			<name>Юго-Западный округ</name>
			<area>11136</area>
			<population>1243826</population>
			<parentName>-</parentName>
			<id>1006</id>
		</region>
		<region>
			<name>Южный округ</name>
			<area>13177</area>
			<population>1573442</population>
			<parentName>-</parentName>
			<id>1007</id>
		</region>
		<region>
			<name>Юго-Восточный округ</name>
			<area>11756</area>
			<population>1160743</population>
			<parentName>-</parentName>
			<id>1008</id>
		</region>
		<region>
			<name>Восточный округ</name>
			<area>15483</area>
			<population>1403493</population>
			<parentName>-</parentName>
			<id>1009</id>
		</region>
		<region>
			<name>Зеленоградский округ</name>
			<area>3720</area>
			<population>223902</population>
			<parentName>-</parentName>
			<id>1010</id>
		</region>
		<region>
			<name>район Аэропорт</name>
			<area>458</area>
			<population>76500</population>
			<parentName>Северный округ</parentName>
			<id>2011</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Беговой район</name>
			<area>556</area>
			<population>42700</population>
			<parentName>Северный округ</parentName>
			<id>2012</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Бескудниковский район</name>
			<area>330</area>
			<population>75100</population>
			<parentName>Северный округ</parentName>
			<id>2013</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Войковский район</name>
			<area>661</area>
			<population>66700</population>
			<parentName>Северный округ</parentName>
			<id>2014</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Восточное Дегунино</name>
			<area>377</area>
			<population>95300</population>
			<parentName>Северный округ</parentName>
			<id>2015</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Головинский район</name>
			<area>893</area>
			<population>100200</population>
			<parentName>Северный округ</parentName>
			<id>2016</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Дмитровский район</name>
			<area>729</area>
			<population>87900</population>
			<parentName>Северный округ</parentName>
			<id>2017</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Западное Дегунино</name>
			<area>753</area>
			<population>78400</population>
			<parentName>Северный округ</parentName>
			<id>2018</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Коптево</name>
			<area>538</area>
			<population>97400</population>
			<parentName>Северный округ</parentName>
			<id>2019</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Левобережный район</name>
			<area>646</area>
			<population>51400</population>
			<parentName>Северный округ</parentName>
			<id>2020</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Молжаниновский район</name>
			<area>2178</area>
			<population>3500</population>
			<parentName>Северный округ</parentName>
			<id>2021</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Савеловский район</name>
			<area>270</area>
			<population>56900</population>
			<parentName>Северный округ</parentName>
			<id>2022</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Сокол</name>
			<area>372</area>
			<population>57600</population>
			<parentName>Северный округ</parentName>
			<id>2023</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Тимирязевский район</name>
			<area>1043</area>
			<population>82800</population>
			<parentName>Северный округ</parentName>
			<id>2024</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Ховрино</name>
			<area>573</area>
			<population>81200</population>
			<parentName>Северный округ</parentName>
			<id>2025</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Хорошевский район</name>
			<area>988</area>
			<population>59300</population>
			<parentName>Северный округ</parentName>
			<id>2026</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Внуково</name>
			<area>1737</area>
			<population>20500</population>
			<parentName>Западный округ</parentName>
			<id>2027</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Дорогомилово</name>
			<area>796</area>
			<population>63500</population>
			<parentName>Западный округ</parentName>
			<id>2028</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Крылатское</name>
			<area>1204</area>
			<population>76700</population>
			<parentName>Западный округ</parentName>
			<id>2029</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Кунцево</name>
			<area>1656</area>
			<population>126200</population>
			<parentName>Западный округ</parentName>
			<id>2030</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>Можайский район</name>
			<area>1075</area>
			<population>112600</population>
			<parentName>Западный округ</parentName>
			<id>2031</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Ново-Переделкино</name>
			<area>848</area>
			<population>94000</population>
			<parentName>Западный округ</parentName>
			<id>2032</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Очаково-Матвеевское</name>
			<area>1754</area>
			<population>92100</population>
			<parentName>Западный округ</parentName>
			<id>2033</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Проспект Вернадского</name>
			<area>465</area>
			<population>56400</population>
			<parentName>Западный округ</parentName>
			<id>2034</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Раменки</name>
			<area>1854</area>
			<population>104800</population>
			<parentName>Западный округ</parentName>
			<id>2035</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Солнцево</name>
			<area>1129</area>
			<population>89900</population>
			<parentName>Западный округ</parentName>
			<id>2036</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Тропарево-Никулино</name>
			<area>1127</area>
			<population>103600</population>
			<parentName>Западный округ</parentName>
			<id>2037</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Филевский Парк</name>
			<area>962</area>
			<population>65800</population>
			<parentName>Западный округ</parentName>
			<id>2038</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Фили-Давыдково</name>
			<area>696</area>
			<population>92400</population>
			<parentName>Западный округ</parentName>
			<id>2039</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Арбат</name>
			<area>211</area>
			<population>26900</population>
			<parentName>Центральный округ</parentName>
			<id>2040</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Басманный район</name>
			<area>837</area>
			<population>100500</population>
			<parentName>Центральный округ</parentName>
			<id>2041</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Замоскворечье</name>
			<area>432</area>
			<population>50800</population>
			<parentName>Центральный округ</parentName>
			<id>2042</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Красносельский район</name>
			<area>496</area>
			<population>43300</population>
			<parentName>Центральный округ</parentName>
			<id>2043</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Мещанский район</name>
			<area>460</area>
			<population>55100</population>
			<parentName>Центральный округ</parentName>
			<id>2044</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Пресненский район</name>
			<area>1170</area>
			<population>116200</population>
			<parentName>Центральный округ</parentName>
			<id>2045</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Таганский район</name>
			<area>801</area>
			<population>107500</population>
			<parentName>Центральный округ</parentName>
			<id>2046</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Тверской район</name>
			<area>727</area>
			<population>73800</population>
			<parentName>Центральный округ</parentName>
			<id>2047</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Хамовники</name>
			<area>1008</area>
			<population>99500</population>
			<parentName>Центральный округ</parentName>
			<id>2048</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Якиманка</name>
			<area>480</area>
			<population>23000</population>
			<parentName>Центральный округ</parentName>
			<id>2049</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Алексеевский район</name>
			<area>529</area>
			<population>70500</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2050</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Алтуфьевский район</name>
			<area>325</area>
			<population>48900</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2051</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Бабушкинский район</name>
			<area>507</area>
			<population>77300</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2052</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Бибирево</name>
			<area>645</area>
			<population>149500</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2053</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Бутырский район</name>
			<area>504</area>
			<population>61200</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2054</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Лианозово</name>
			<area>579</area>
			<population>78600</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2055</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Лосиноостровский район</name>
			<area>554</area>
			<population>72200</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2056</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Марфино</name>
			<area>226</area>
			<population>25100</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2057</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Марьина Роща</name>
			<area>468</area>
			<population>59500</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2058</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Останкинский район</name>
			<area>1246</area>
			<population>55600</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2059</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Отрадное</name>
			<area>1016</area>
			<population>168800</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2060</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Ростокино</name>
			<area>354</area>
			<population>34100</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2061</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Свиблово</name>
			<area>441</area>
			<population>54400</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2062</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Северное Медведково</name>
			<area>566</area>
			<population>114500</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2063</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Северный район</name>
			<area>1029</area>
			<population>19800</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2064</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Южное Медведково</name>
			<area>387</area>
			<population>73900</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2065</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Ярославский район</name>
			<area>799</area>
			<population>85500</population>
			<parentName>Северо-Восточный округ</parentName>
			<id>2066</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Куркино</name>
			<area>804</area>
			<population>17900</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2067</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Митино</name>
			<area>1266</area>
			<population>147500</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2068</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Покровское-Стрешнево</name>
			<area>1290</area>
			<population>48100</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2069</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Северное Тушино</name>
			<area>940</area>
			<population>136200</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2070</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Строгино</name>
			<area>1684</area>
			<population>124500</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2071</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Хорошево-Мневники</name>
			<area>1781</area>
			<population>147100</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2072</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Щукино</name>
			<area>768</area>
			<population>92200</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2073</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Южное Тушино</name>
			<area>794</area>
			<population>91900</population>
			<parentName>Северо-Западный округ</parentName>
			<id>2074</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>Академический район</name>
			<area>583</area>
			<population>93400</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2075</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Гагаринский район</name>
			<area>553</area>
			<population>71800</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2076</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Зюзино</name>
			<area>545</area>
			<population>113500</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2077</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Коньково</name>
			<area>718</area>
			<population>140000</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2078</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Котловка</name>
			<area>394</area>
			<population>58100</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2079</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Ломоносовский район</name>
			<area>336</area>
			<population>79300</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2080</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Обручевский район</name>
			<area>611</area>
			<population>71500</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2081</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Северное Бутово</name>
			<area>913</area>
			<population>78400</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2082</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Теплый Стан</name>
			<area>843</area>
			<population>114300</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2083</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Черемушки</name>
			<area>552</area>
			<population>91100</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2084</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Ясенево</name>
			<area>2537</area>
			<population>169200</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2085</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Бирюлево Восточное</name>
			<area>1446</area>
			<population>131200</population>
			<parentName>Южный округ</parentName>
			<id>2086</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Бирюлево Западное</name>
			<area>851</area>
			<population>82600</population>
			<parentName>Южный округ</parentName>
			<id>2087</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Братеево</name>
			<area>763</area>
			<population>94800</population>
			<parentName>Южный округ</parentName>
			<id>2088</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Даниловский район</name>
			<area>1260</area>
			<population>84900</population>
			<parentName>Южный округ</parentName>
			<id>2089</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Донской район</name>
			<area>573</area>
			<population>44900</population>
			<parentName>Южный округ</parentName>
			<id>2090</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Зябликово</name>
			<area>438</area>
			<population>118800</population>
			<parentName>Южный округ</parentName>
			<id>2091</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Москворечье-Сабурово</name>
			<area>930</area>
			<population>69100</population>
			<parentName>Южный округ</parentName>
			<id>2092</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Нагатино-Садовники</name>
			<area>817</area>
			<population>68400</population>
			<parentName>Южный округ</parentName>
			<id>2093</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Нагатинский Затон</name>
			<area>996</area>
			<population>104900</population>
			<parentName>Южный округ</parentName>
			<id>2094</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Нагорный район</name>
			<area>542</area>
			<population>71500</population>
			<parentName>Южный округ</parentName>
			<id>2095</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Орехово-Борисово Северное</name>
			<area>767</area>
			<population>118400</population>
			<parentName>Южный округ</parentName>
			<id>2096</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Орехово-Борисово Южное</name>
			<area>694</area>
			<population>133800</population>
			<parentName>Южный округ</parentName>
			<id>2097</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Царицыно</name>
			<area>843</area>
			<population>114300</population>
			<parentName>Южный округ</parentName>
			<id>2098</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Чертаново Северное</name>
			<area>690</area>
			<population>101400</population>
			<parentName>Южный округ</parentName>
			<id>2099</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Чертаново Центральное</name>
			<area>652</area>
			<population>103600</population>
			<parentName>Южный округ</parentName>
			<id>2100</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Чертаново Южное</name>
			<area>938</area>
			<population>130800</population>
			<parentName>Южный округ</parentName>
			<id>2101</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Выхино-Жулебино</name>
			<area>1497</area>
			<population>187900</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2102</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Капотня</name>
			<area>806</area>
			<population>27200</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2103</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Кузьминки</name>
			<area>815</area>
			<population>123400</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2104</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Лефортово</name>
			<area>906</area>
			<population>90200</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2105</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Люблино</name>
			<area>1741</area>
			<population>152100</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2106</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Марьино</name>
			<area>1198</area>
			<population>223400</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2107</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Некрасовка</name>
			<area>558</area>
			<population>11100</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2108</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Нижегородский район</name>
			<area>753</area>
			<population>37500</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2109</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Печатники</name>
			<area>1789</area>
			<population>74400</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2110</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Рязанский район</name>
			<area>649</area>
			<population>88400</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2111</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Текстильщики</name>
			<area>591</area>
			<population>84800</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2112</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Южнопортовый район</name>
			<area>453</area>
			<population>60300</population>
			<parentName>Юго-Восточный округ</parentName>
			<id>2113</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Богородское</name>
			<area>865</area>
			<population>97700</population>
			<parentName>Восточный округ</parentName>
			<id>2114</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Вешняки</name>
			<area>1067</area>
			<population>121600</population>
			<parentName>Восточный округ</parentName>
			<id>2115</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Восточное Измайлово</name>
			<area>385</area>
			<population>72100</population>
			<parentName>Восточный округ</parentName>
			<id>2116</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Восточный район</name>
			<area>320</area>
			<population>12400</population>
			<parentName>Восточный округ</parentName>
			<id>2117</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Гольяново</name>
			<area>1499</area>
			<population>155900</population>
			<parentName>Восточный округ</parentName>
			<id>2118</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Ивановское</name>
			<area>1017</area>
			<population>125200</population>
			<parentName>Восточный округ</parentName>
			<id>2119</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Измайлово</name>
			<area>1524</area>
			<population>102900</population>
			<parentName>Восточный округ</parentName>
			<id>2120</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Косино-Ухтомский район</name>
			<area>1506</area>
			<population>51000</population>
			<parentName>Восточный округ</parentName>
			<id>2121</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Метрогородок</name>
			<area>2757</area>
			<population>36900</population>
			<parentName>Восточный округ</parentName>
			<id>2122</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Новогиреево</name>
			<area>446</area>
			<population>93400</population>
			<parentName>Восточный округ</parentName>
			<id>2123</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Новокосино</name>
			<area>360</area>
			<population>100700</population>
			<parentName>Восточный округ</parentName>
			<id>2124</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Перово</name>
			<area>973</area>
			<population>134500</population>
			<parentName>Восточный округ</parentName>
			<id>2125</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Преображенское</name>
			<area>562</area>
			<population>80000</population>
			<parentName>Восточный округ</parentName>
			<id>2126</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Северное Измайлово</name>
			<area>420</area>
			<population>81600</population>
			<parentName>Восточный округ</parentName>
			<id>2127</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Соколиная Гора</name>
			<area>784</area>
			<population>84100</population>
			<parentName>Восточный округ</parentName>
			<id>2128</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Сокольники</name>
			<area>1028</area>
			<population>53500</population>
			<parentName>Восточный округ</parentName>
			<id>2129</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Крюково</name>
			<area>1049</area>
			<population>85642</population>
			<parentName>Зеленоградский округ</parentName>
			<id>2130</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Матушкино</name>
			<area>438</area>
			<population>38509</population>
			<parentName>Зеленоградский округ</parentName>
			<id>2131</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Савелки</name>
			<area>813</area>
			<population>32534</population>
			<parentName>Зеленоградский округ</parentName>
			<id>2132</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Силино</name>
			<area>1040</area>
			<population>38555</population>
			<parentName>Зеленоградский округ</parentName>
			<id>2133</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Старое Крюково</name>
			<area>381</area>
			<population>28662</population>
			<parentName>Зеленоградский округ</parentName>
			<id>2134</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Южное Бутово</name>
			<area>2554</area>
			<population>163200</population>
			<parentName>Юго-Западный округ</parentName>
			<id>2135</id>
			<parentId>1006</parentId>
		</region>
	</regions>
}

Storage Default
{
<Data name="MoscowRegionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>color</Value>
</Value>
<Value name="4">
<Value>latitude</Value>
</Value>
<Value name="5">
<Value>longitude</Value>
</Value>
<Value name="6">
<Value>area</Value>
</Value>
<Value name="7">
<Value>population</Value>
</Value>
<Value name="8">
<Value>parentName</Value>
</Value>
<Value name="9">
<Value>parent</Value>
</Value>
<Value name="10">
<Value>parentId</Value>
</Value>
</Data>
<DataLocation>^map.MoscowRegionD</DataLocation>
<DefaultData>MoscowRegionDefaultData</DefaultData>
<IdLocation>^map.MoscowRegionD</IdLocation>
<IndexLocation>^map.MoscowRegionI</IndexLocation>
<StreamLocation>^map.MoscowRegionS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

