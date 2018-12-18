///
Class map.Elections2018Cube Extends %DeepSee.CubeDefinition [ DependsOn = map.MoscowElections2012, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Elections2018Cube" displayName="Elections2018Cube" disabled="false" abstract="false" sourceClass="map.MoscowElections2018" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="Territory" disabled="false" hasAll="false" allCaption="All region" allDisplayName="region" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Region" displayName="Region" disabled="false" sourceProperty="region.parent.name" list="false" nullReplacement="Не достаточно подробные данные" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="population" disabled="false" sourceProperty="region.parent.population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="name" disabled="false" sourceProperty="region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="true">
        </property>
        <property name="coordsKey" disabled="false" sourceExpression="%source.region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
      <level name="Subregion" displayName="Subregion" disabled="false" sourceProperty="region.name" list="false" nullReplacement="Не достаточно подробные данные" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="population" disabled="false" sourceProperty="region.population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="name" disabled="false" sourceProperty="region.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="true">
        </property>
        <property name="coordsKey" disabled="false" sourceExpression="%source.region.parent.name" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <measure name="Baburin" displayName="Baburin SN" disabled="false" sourceProperty="Baburin" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Grudinin" displayName="Grudinin PN" disabled="false" sourceProperty="Grudinin" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Putin" displayName="Putin VV" disabled="false" sourceProperty="Putin" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Sobchak" displayName="Sobchak KA" disabled="false" sourceProperty="Sobchak" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Suraykin" displayName="Suraykin MA" disabled="false" sourceProperty="Suraykin" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Titov" displayName="Titov BY" disabled="false" sourceProperty="Titov" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Yavlinsky" displayName="Yavlinsky GA" disabled="false" sourceProperty="Yavlinsky" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="Zhirinovsky" displayName="Zhirinovsky VV" disabled="false" sourceProperty="Zhirinovsky" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="votersIncludedInVotersList" displayName="Number of voters" disabled="false" sourceProperty="votersIncludedInVotersList" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="population" displayName="Population" disabled="false" sourceProperty="region.population" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
  <measure name="validBallots" displayName="Number of valid ballots" disabled="false" sourceProperty="validBallots" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <measure name="attandance" displayName="Attandance" disabled="false" sourceExpression="%source.ballotsIssuedToVotersWhoVotedEarly + %source.ballotsIssuedInPollingStationOnElectionDay + %source.ballotsIssuedOutsidePollingStationOnElectionDay" aggregate="SUM" type="integer" hidden="false" searchable="false">
  </measure>
</cube>
}

Parameter DOMAIN;

}
