xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.amx.com/CO/Schema/ConsultProperties/v1";
(:: import schema at "../Schemas/ConsultPropertiesV1.0.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_ConsultProperties_JCA";
(:: import schema at "../Schemas/BS_ConsultProperties_JCA_sp.xsd" ::)

declare variable $output as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($output as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:ConsultPropertiesResponse) ::) {
    <ns2:ConsultPropertiesResponse>
        <ns2:code>{fn:data($output/ns1:P_CODE)}</ns2:code>
        <ns2:description>{fn:data($output/ns1:P_DESCRIPTION)}</ns2:description>
        {
          if(string-length(string($output/ns1:P_CURSOR)) > 0)
          then(
          <ns2:records>
            {
                for $Row in $output/ns1:P_CURSOR/ns1:Row
                return 
                <ns2:record>
                    <ns2:table>{fn:data($Row/ns1:Column[@name = 'TABLA'])}</ns2:table>
                    <ns2:code>{fn:data($Row/ns1:Column[@name = 'CODIGO'])}</ns2:code>
                    <ns2:value>{fn:data($Row/ns1:Column[@name = 'VALOR'])}</ns2:value>
                    <ns2:status>{fn:data($Row/ns1:Column[@name = 'ESTADO'])}</ns2:status>
                    <ns2:application>{fn:data($Row/ns1:Column[@name = 'APLICACION'])}</ns2:application>
                </ns2:record>
            }
          </ns2:records>
          )
          else()
        }

    </ns2:ConsultPropertiesResponse>
};

local:func($output)
