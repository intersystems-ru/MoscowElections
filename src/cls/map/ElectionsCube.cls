/// 
Class map.ElectionsCube Extends %DeepSee.CubeDefinition [ DependsOn = map.MoscowElections2012, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="ElectionsCube" displayName="ElectionsCube" disabled="false" abstract="false" sourceClass="map.MoscowElections2012" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="Territory" disabled="false" hasAll="false" allCaption="All region" allDisplayName="region" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Region" displayName="Административный округ" disabled="false" sourceProperty="region.parent.name" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="population" disabled="false" sourceProperty="region.parent.population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="name" disabled="false" sourceProperty="region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="true">
        </property>
        <property name="coordsKey" disabled="false" sourceExpression="%source.region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
      <level name="Subregion" displayName="Район" disabled="false" sourceProperty="region.name" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="population" disabled="false" sourceProperty="region.population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="name" disabled="false" sourceProperty="region.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="true">
        </property>
        <property name="coordsKey" disabled="false" sourceExpression="%source.region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <measure name="Mironov" displayName="Миронов СМ" disabled="false" sourceProperty="Mironov" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Prokhorov" displayName="Прохоров МД" disabled="false" sourceProperty="Prokhorov" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Putin" displayName="Путин ВВ" disabled="false" sourceProperty="Putin" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Zhirinovsky" displayName="Жириновский ВВ" disabled="false" sourceProperty="Zhirinovsky" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Zyuganov" displayName="Зюганов ГА" disabled="false" sourceProperty="Zyuganov" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="validBallots" displayName="Число действительных избирательных бюллетеней" disabled="false" sourceProperty="validBallots" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="votersIncludedInVotersList" displayName="Число избирателей" disabled="false" sourceProperty="votersIncludedInVotersList" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="population" disabled="false" sourceProperty="region.population" aggregate="AVG" type="integer" hidden="false" searchable="false">
  </measure>
</cube>
}

Parameter DOMAIN;

}

