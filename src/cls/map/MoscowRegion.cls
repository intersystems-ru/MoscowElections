Class map.MoscowRegion Extends (%Persistent, %XML.Adaptor)
{

Index idIndex On id [ IdKey, PrimaryKey, Unique ];

/// Код
Property id As %String [ Required ];

/// Название админ. единицы
Property name As %String(MAXLEN = 250);

/// Площадь, га
Property area As %Float;

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
			<parentName>-</parentName>
			<area>66.18</area>
			<population>769630</population>
			<id>1001</id>
		</region>
		<region>
			<name>Северный округ</name>
			<parentName>-</parentName>
			<area>113.73</area>
			<population>1160576</population>
			<id>1002</id>
		</region>
		<region>
			<name>Северо-Восточный округ</name>
			<parentName>-</parentName>
			<area>101.88</area>
			<population>1415283</population>
			<id>1003</id>
		</region>
		<region>
			<name>Восточный округ</name>
			<parentName>-</parentName>
			<area>154.84</area>
			<population>1507198</population>
			<id>1004</id>
		</region>
		<region>
			<name>Юго-Восточный округ</name>
			<parentName>-</parentName>
			<area>117.56</area>
			<population>1385385</population>
			<id>1005</id>
		</region>
		<region>
			<name>Южный округ</name>
			<parentName>-</parentName>
			<area>131.77</area>
			<population>1776789</population>
			<id>1006</id>
		</region>
		<region>
			<name>Юго-Западный округ</name>
			<parentName>-</parentName>
			<area>111.36</area>
			<population>1427284</population>
			<id>1007</id>
		</region>
		<region>
			<name>Западный округ</name>
			<parentName>-</parentName>
			<area>153.03</area>
			<population>1368731</population>
			<id>1008</id>
		</region>
		<region>
			<name>Северо-Западный округ</name>
			<parentName>-</parentName>
			<area>93.28</area>
			<population>990696</population>
			<id>1009</id>
		</region>
		<region>
			<name>Зеленоградский округ</name>
			<parentName>-</parentName>
			<area>37.2</area>
			<population>239861</population>
			<id>1010</id>
		</region>
		<region>
			<name>Троицкий административный округ</name>
			<parentName>-</parentName>
			<area>1084.34</area>
			<population>122522</population>
			<id>1011</id>
		</region>
		<region>
			<name>Новомосковский административный округ</name>
			<parentName>-</parentName>
			<area>361.36</area>
			<population>216709</population>
			<id>1012</id>
		</region>
		<region>
			<name>Академический район</name>
			<parentName>Юго-Западный округ</parentName>
			<area>5.83</area>
			<population>109127</population>
			<id>2001</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Алексеевский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.29</area>
			<population>80339</population>
			<id>2002</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Алтуфьевский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>3.25</area>
			<population>57228</population>
			<id>2003</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Арбат</name>
			<parentName>Центральный округ</parentName>
			<area>2.11</area>
			<population>34396</population>
			<id>2004</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Аэропорт</name>
			<parentName>Северный округ</parentName>
			<area>4.58</area>
			<population>78867</population>
			<id>2005</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Бабушкинский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.07</area>
			<population>88152</population>
			<id>2006</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Басманный район</name>
			<parentName>Центральный округ</parentName>
			<area>8.37</area>
			<population>110083</population>
			<id>2007</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Беговой</name>
			<parentName>Северный округ</parentName>
			<area>5.56</area>
			<population>42691</population>
			<id>2008</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Бескудниковский район</name>
			<parentName>Северный округ</parentName>
			<area>3.3</area>
			<population>77894</population>
			<id>2009</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Бибирево</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>6.45</area>
			<population>159811</population>
			<id>2010</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Бирюлево Восточное</name>
			<parentName>Южный округ</parentName>
			<area>14.77</area>
			<population>152450</population>
			<id>2011</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Бирюлево Западное</name>
			<parentName>Южный округ</parentName>
			<area>8.51</area>
			<population>88164</population>
			<id>2012</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Богородское</name>
			<parentName>Восточный округ</parentName>
			<area>10.24</area>
			<population>107697</population>
			<id>2013</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Братеево</name>
			<parentName>Южный округ</parentName>
			<area>7.63</area>
			<population>108366</population>
			<id>2014</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Бутырский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.04</area>
			<population>70896</population>
			<id>2015</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Вешняки</name>
			<parentName>Восточный округ</parentName>
			<area>10.72</area>
			<population>122073</population>
			<id>2016</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Внуково</name>
			<parentName>Западный округ</parentName>
			<area>17.42</area>
			<population>24671</population>
			<id>2017</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Войковский район</name>
			<parentName>Северный округ</parentName>
			<area>6.61</area>
			<population>69311</population>
			<id>2018</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Восточное Дегунино</name>
			<parentName>Северный округ</parentName>
			<area>3.77</area>
			<population>98347</population>
			<id>2019</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Восточное Измайлово</name>
			<parentName>Восточный округ</parentName>
			<area>3.85</area>
			<population>77913</population>
			<id>2020</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Восточный</name>
			<parentName>Восточный округ</parentName>
			<area>3.14</area>
			<population>13557</population>
			<id>2021</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Выхино-Жулебино</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>14.97</area>
			<population>224366</population>
			<id>2022</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>Гагаринский район</name>
			<parentName>Юго-Западный округ</parentName>
			<area>5.5</area>
			<population>78840</population>
			<id>2023</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Головинский район</name>
			<parentName>Северный округ</parentName>
			<area>8.93</area>
			<population>103064</population>
			<id>2024</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Гольяново</name>
			<parentName>Восточный округ</parentName>
			<area>14.99</area>
			<population>161906</population>
			<id>2025</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>Даниловский район</name>
			<parentName>Южный округ</parentName>
			<area>12.6</area>
			<population>93296</population>
			<id>2026</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Дмитровский район</name>
			<parentName>Северный округ</parentName>
			<area>7.29</area>
			<population>92517</population>
			<id>2027</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>Донской район</name>
			<parentName>Южный округ</parentName>
			<area>5.73</area>
			<population>51701</population>
			<id>2028</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Дорогомилово</name>
			<parentName>Западный округ</parentName>
			<area>7.95</area>
			<population>72873</population>
			<id>2029</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Замоскворечье</name>
			<parentName>Центральный округ</parentName>
			<area>4.32</area>
			<population>57871</population>
			<id>2030</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Западное Дегунино</name>
			<parentName>Северный округ</parentName>
			<area>7.53</area>
			<population>81597</population>
			<id>2031</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Зюзино</name>
			<parentName>Юго-Западный округ</parentName>
			<area>5.45</area>
			<population>126365</population>
			<id>2032</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Зябликово</name>
			<parentName>Южный округ</parentName>
			<area>4.38</area>
			<population>132993</population>
			<id>2033</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Ивановское</name>
			<parentName>Восточный округ</parentName>
			<area>10.19</area>
			<population>127379</population>
			<id>2034</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Измайлово</name>
			<parentName>Восточный округ</parentName>
			<area>15.24</area>
			<population>106154</population>
			<id>2035</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Капотня</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>8.06</area>
			<population>32315</population>
			<id>2036</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Коньково</name>
			<parentName>Юго-Западный округ</parentName>
			<area>7.18</area>
			<population>155966</population>
			<id>2037</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Коптево</name>
			<parentName>Северный округ</parentName>
			<area>5.38</area>
			<population>101098</population>
			<id>2038</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Косино-Ухтомский</name>
			<parentName>Восточный округ</parentName>
			<area>15.05</area>
			<population>80794</population>
			<id>2039</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Котловка</name>
			<parentName>Юго-Западный округ</parentName>
			<area>3.94</area>
			<population>65793</population>
			<id>2040</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Красносельский район</name>
			<parentName>Центральный округ</parentName>
			<area>4.96</area>
			<population>48474</population>
			<id>2041</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Крылатское</name>
			<parentName>Западный округ</parentName>
			<area>12.04</area>
			<population>82198</population>
			<id>2042</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Крюково</name>
			<parentName>Зеленоградский округ</parentName>
			<area>10.49</area>
			<population>95645</population>
			<id>2043</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Кузьминки</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>8.15</area>
			<population>145227</population>
			<id>2044</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Кунцево</name>
			<parentName>Западный округ</parentName>
			<area>16.56</area>
			<population>150513</population>
			<id>2045</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Куркино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>7.9</area>
			<population>32325</population>
			<id>2046</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Левобережный район</name>
			<parentName>Северный округ</parentName>
			<area>8</area>
			<population>53314</population>
			<id>2047</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Лефортово</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>9.06</area>
			<population>93311</population>
			<id>2048</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Лианозово</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.79</area>
			<population>85097</population>
			<id>2049</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Ломоносовский район</name>
			<parentName>Юго-Западный округ</parentName>
			<area>3.34</area>
			<population>87621</population>
			<id>2050</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Лосиноостровский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.54</area>
			<population>82821</population>
			<id>2051</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Люблино</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>17.41</area>
			<population>171740</population>
			<id>2052</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Марфино</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>2.97</area>
			<population>33640</population>
			<id>2053</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Марьина Роща</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>4.68</area>
			<population>67234</population>
			<id>2054</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Марьино</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>11.91</area>
			<population>252597</population>
			<id>2055</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Матушкино</name>
			<parentName>Зеленоградский округ</parentName>
			<area>4.38</area>
			<population>40057</population>
			<id>2056</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Метрогородок</name>
			<parentName>Восточный округ</parentName>
			<area>27.57</area>
			<population>37972</population>
			<id>2057</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>Мещанский район</name>
			<parentName>Центральный округ</parentName>
			<area>4.6</area>
			<population>60121</population>
			<id>2058</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Митино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>12.67</area>
			<population>188671</population>
			<id>2059</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Можайский район</name>
			<parentName>Западный округ</parentName>
			<area>10.73</area>
			<population>137077</population>
			<id>2060</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Молжаниновский район</name>
			<parentName>Северный округ</parentName>
			<area>21.78</area>
			<population>7208</population>
			<id>2061</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Москворечье-Сабурово</name>
			<parentName>Южный округ</parentName>
			<area>9.3</area>
			<population>80346</population>
			<id>2062</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Нагатино-Садовники</name>
			<parentName>Южный округ</parentName>
			<area>8.17</area>
			<population>82064</population>
			<id>2063</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Нагатинский затон</name>
			<parentName>Южный округ</parentName>
			<area>9.8</area>
			<population>119317</population>
			<id>2064</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Нагорный район</name>
			<parentName>Южный округ</parentName>
			<area>5.42</area>
			<population>80981</population>
			<id>2065</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Некрасовка</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>5.58</area>
			<population>46989</population>
			<id>2066</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>Нижегородский район</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>7.57</area>
			<population>45153</population>
			<id>2067</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Новогиреево</name>
			<parentName>Восточный округ</parentName>
			<area>4.45</area>
			<population>97428</population>
			<id>2068</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Новокосино</name>
			<parentName>Восточный округ</parentName>
			<area>3.6</area>
			<population>106931</population>
			<id>2069</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Ново-Переделкино</name>
			<parentName>Западный округ</parentName>
			<area>8.48</area>
			<population>121024</population>
			<id>2070</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>Обручевский район</name>
			<parentName>Юго-Западный округ</parentName>
			<area>6.11</area>
			<population>84257</population>
			<id>2071</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Орехово-Борисово Северное</name>
			<parentName>Южный округ</parentName>
			<area>7.67</area>
			<population>131891</population>
			<id>2072</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Орехово-Борисово Южное</name>
			<parentName>Южный округ</parentName>
			<area>6.94</area>
			<population>147684</population>
			<id>2073</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>Останкинский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>12.46</area>
			<population>63075</population>
			<id>2074</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Отрадное</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>10.18</area>
			<population>183921</population>
			<id>2075</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Очаково-Матвеевское</name>
			<parentName>Западный округ</parentName>
			<area>17.54</area>
			<population>127942</population>
			<id>2076</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Перово</name>
			<parentName>Восточный округ</parentName>
			<area>9.73</area>
			<population>140714</population>
			<id>2077</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Печатники</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>17.89</area>
			<population>86395</population>
			<id>2078</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Покровское-Стрешнево</name>
			<parentName>Северо-Западный округ</parentName>
			<area>12.9</area>
			<population>57216</population>
			<id>2079</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Преображенское</name>
			<parentName>Восточный округ</parentName>
			<area>5.61</area>
			<population>88627</population>
			<id>2080</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>Пресненский район</name>
			<parentName>Центральный округ</parentName>
			<area>11.7</area>
			<population>126178</population>
			<id>2081</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Проспект Вернадского</name>
			<parentName>Западный округ</parentName>
			<area>4.65</area>
			<population>63474</population>
			<id>2082</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Раменки</name>
			<parentName>Западный округ</parentName>
			<area>18.54</area>
			<population>137093</population>
			<id>2083</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Ростокино</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>3.54</area>
			<population>39217</population>
			<id>2084</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>Рязанский район</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>6.49</area>
			<population>108542</population>
			<id>2085</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Савелки</name>
			<parentName>Зеленоградский округ</parentName>
			<area>8.13</area>
			<population>33846</population>
			<id>2086</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>Савеловский район</name>
			<parentName>Северный округ</parentName>
			<area>2.7</area>
			<population>59106</population>
			<id>2087</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Свиблово</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>4.41</area>
			<population>61821</population>
			<id>2088</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Северное Бутово</name>
			<parentName>Юго-Западный округ</parentName>
			<area>9.13</area>
			<population>95065</population>
			<id>2089</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Северное Измайлово</name>
			<parentName>Восточный округ</parentName>
			<area>4.2</area>
			<population>87247</population>
			<id>2090</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Северное Медведково</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>5.66</area>
			<population>126694</population>
			<id>2091</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Северное Тушино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>9.4</area>
			<population>164770</population>
			<id>2092</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Северный</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>10.29</area>
			<population>33096</population>
			<id>2093</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Силино</name>
			<parentName>Зеленоградский округ</parentName>
			<area>10.4</area>
			<population>39724</population>
			<id>2094</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Сокол</name>
			<parentName>Северный округ</parentName>
			<area>3.72</area>
			<population>59073</population>
			<id>2095</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Соколиная гора</name>
			<parentName>Восточный округ</parentName>
			<area>7.84</area>
			<population>89972</population>
			<id>2096</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Сокольники</name>
			<parentName>Восточный округ</parentName>
			<area>10.28</area>
			<population>60834</population>
			<id>2097</id>
			<parentId>1004</parentId>
		</region>
		<region>
			<name>район Солнцево</name>
			<parentName>Западный округ</parentName>
			<area>11.29</area>
			<population>123371</population>
			<id>2098</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Старое Крюково</name>
			<parentName>Зеленоградский округ</parentName>
			<area>3.81</area>
			<population>30589</population>
			<id>2099</id>
			<parentId>1010</parentId>
		</region>
		<region>
			<name>район Строгино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>16.84</area>
			<population>159168</population>
			<id>2100</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Таганский район</name>
			<parentName>Центральный округ</parentName>
			<area>8.01</area>
			<population>119989</population>
			<id>2101</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Тверской район</name>
			<parentName>Центральный округ</parentName>
			<area>7.27</area>
			<population>77234</population>
			<id>2102</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Текстильщики</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>5.92</area>
			<population>104653</population>
			<id>2103</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Теплый Стан</name>
			<parentName>Юго-Западный округ</parentName>
			<area>7.5</area>
			<population>133905</population>
			<id>2104</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>Тимирязевский район</name>
			<parentName>Северный округ</parentName>
			<area>10.43</area>
			<population>83394</population>
			<id>2105</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Тропарево-Никулино</name>
			<parentName>Западный округ</parentName>
			<area>11.27</area>
			<population>121754</population>
			<id>2106</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Филевский парк</name>
			<parentName>Западный округ</parentName>
			<area>9.62</area>
			<population>92168</population>
			<id>2107</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Фили-Давыдково</name>
			<parentName>Западный округ</parentName>
			<area>6.96</area>
			<population>114573</population>
			<id>2108</id>
			<parentId>1008</parentId>
		</region>
		<region>
			<name>район Хамовники</name>
			<parentName>Центральный округ</parentName>
			<area>10.08</area>
			<population>107821</population>
			<id>2109</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>район Ховрино</name>
			<parentName>Северный округ</parentName>
			<area>5.73</area>
			<population>85401</population>
			<id>2110</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Хорошево-Мневники</name>
			<parentName>Северо-Западный округ</parentName>
			<area>17.18</area>
			<population>170913</population>
			<id>2111</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Хорошевский район</name>
			<parentName>Северный округ</parentName>
			<area>9.88</area>
			<population>67694</population>
			<id>2112</id>
			<parentId>1002</parentId>
		</region>
		<region>
			<name>район Царицыно</name>
			<parentName>Южный округ</parentName>
			<area>8.43</area>
			<population>128303</population>
			<id>2113</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Черемушки</name>
			<parentName>Юго-Западный округ</parentName>
			<area>5.52</area>
			<population>107685</population>
			<id>2114</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Чертаново Северное</name>
			<parentName>Южный округ</parentName>
			<area>5.4</area>
			<population>114388</population>
			<id>2115</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Чертаново Центральное</name>
			<parentName>Южный округ</parentName>
			<area>6.52</area>
			<population>116575</population>
			<id>2116</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Чертаново Южное</name>
			<parentName>Южный округ</parentName>
			<area>9.38</area>
			<population>148270</population>
			<id>2117</id>
			<parentId>1006</parentId>
		</region>
		<region>
			<name>район Щукино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>7.69</area>
			<population>109321</population>
			<id>2118</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>район Южное Бутово</name>
			<parentName>Юго-Западный округ</parentName>
			<area>25.54</area>
			<population>205064</population>
			<id>2119</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>район Южное Медведково</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>3.88</area>
			<population>85007</population>
			<id>2120</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Южное Тушино</name>
			<parentName>Северо-Западный округ</parentName>
			<area>7.94</area>
			<population>108312</population>
			<id>2121</id>
			<parentId>1009</parentId>
		</region>
		<region>
			<name>Южнопортовый район</name>
			<parentName>Юго-Восточный округ</parentName>
			<area>4.53</area>
			<population>74097</population>
			<id>2122</id>
			<parentId>1005</parentId>
		</region>
		<region>
			<name>район Якиманка</name>
			<parentName>Центральный округ</parentName>
			<area>4.8</area>
			<population>27463</population>
			<id>2123</id>
			<parentId>1001</parentId>
		</region>
		<region>
			<name>Ярославский район</name>
			<parentName>Северо-Восточный округ</parentName>
			<area>7.99</area>
			<population>97234</population>
			<id>2124</id>
			<parentId>1003</parentId>
		</region>
		<region>
			<name>район Ясенево</name>
			<parentName>Юго-Западный округ</parentName>
			<area>25.37</area>
			<population>177596</population>
			<id>2125</id>
			<parentId>1007</parentId>
		</region>
		<region>
			<name>поселение Внуковское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>25.6</area>
			<population>7029</population>
			<id>2126</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Вороновское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>206.26</area>
			<population>8773</population>
			<id>2127</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Воскресенское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>24.77</area>
			<population>8854</population>
			<id>2128</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Десеновское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>52.96</area>
			<population>14707</population>
			<id>2129</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Киевский</name>
			<parentName>Троицкий административный округ</parentName>
			<area>56.5</area>
			<population>13720</population>
			<id>2130</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Кленовское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>58.3</area>
			<population>3321</population>
			<id>2131</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Кокошкино</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>8.28</area>
			<population>15693</population>
			<id>2132</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Краснопахорское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>87.78</area>
			<population>4789</population>
			<id>2133</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Марушкинское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>50.63</area>
			<population>6874</population>
			<id>2134</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Михайлово-Ярцевское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>63.47</area>
			<population>5258</population>
			<id>2135</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Московский</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>40.6</area>
			<population>53891</population>
			<id>2136</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Мосрентген</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>6.41</area>
			<population>19571</population>
			<id>2137</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Новофедоровское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>156.75</area>
			<population>6702</population>
			<id>2138</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Первомайское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>118.94</area>
			<population>8197</population>
			<id>2139</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Роговское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>175.95</area>
			<population>2919</population>
			<id>2140</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Рязановское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>41.41</area>
			<population>20239</population>
			<id>2141</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Сосенское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>67.07</area>
			<population>15623</population>
			<id>2142</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Троицк</name>
			<parentName>Троицкий административный округ</parentName>
			<area>16.33</area>
			<population>60811</population>
			<id>2143</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Филимонковское</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>35.77</area>
			<population>6724</population>
			<id>2144</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>поселение Щаповское</name>
			<parentName>Троицкий административный округ</parentName>
			<area>86.06</area>
			<population>8032</population>
			<id>2145</id>
			<parentId>1011</parentId>
		</region>
		<region>
			<name>поселение Щербинка</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>7.62</area>
			<population>47504</population>
			<id>2146</id>
			<parentId>1012</parentId>
		</region>
		<region>
			<name>Троицкий административный округ</name>
			<parentName>Троицкий административный округ</parentName>
			<area>1084.34</area>
			<population>122522</population>
			<parentId>1011</parentId>
			<id>10110</id>
		</region>
		<region>
			<name>Новомосковский административный округ (без поселения Сосенское)</name>
			<parentName>Новомосковский административный округ</parentName>
			<area>294.29</area>
			<population>201086</population>
			<parentId>1012</parentId>
			<id>10120</id>
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

