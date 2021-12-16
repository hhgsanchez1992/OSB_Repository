xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/mobile/common/aplicationIntegration/CON/AuthenticationServices/V1.0";
(:: import schema at "../Schemas/WSAuthenticationServicesV1.0.xsd" ::)

declare variable $header as element() external;
declare variable $inbound as element() external;

declare function local:func($header as element(), 
                            $inbound as element()) 
                            as element() (:: schema-element(ns1:AuthenticationServicesRequest) ::) {
    <ns1:AuthenticationServicesRequest>
        <ns1:header>{$header}</ns1:header>
        <ns1:inbound>{$inbound}</ns1:inbound>
    </ns1:AuthenticationServicesRequest>
};

local:func($header, $inbound)
