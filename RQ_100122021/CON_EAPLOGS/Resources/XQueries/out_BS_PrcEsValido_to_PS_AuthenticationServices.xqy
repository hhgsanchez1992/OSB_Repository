xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.amx.com/co/schema/mobile/common/aplicationIntegration/CON/AuthenticationServices/V1.0";
(:: import schema at "../Schemas/WSAuthenticationServicesV1.0.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_PRC_WS_ES_VALIDO";
(:: import schema at "../Schemas/BS_PRC_WS_ES_VALIDO_sp.xsd" ::)

declare variable $faultCode as xs:string external;
declare variable $faultDescription as xs:string external;
declare variable $output as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($output as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:authenticationServicesResponse) ::) {
    if(string-length(string($faultCode)) > 0 and string-length(string($faultDescription)) > 0)
    then(
      <ns2:authenticationServicesResponse>
          <ns2:code>{string($faultCode)}</ns2:code>
          <ns2:description>{fn:data($faultDescription)}</ns2:description>
      </ns2:authenticationServicesResponse>
    )
    else(
      <ns2:authenticationServicesResponse>
          <ns2:code>{string($output/*:OUT_CODRESULTADO)}</ns2:code>
          <ns2:description>{fn:data($output/*:OUT_MGSRESULTADO)}</ns2:description>
      </ns2:authenticationServicesResponse>
    )
    
    
};

local:func($output)