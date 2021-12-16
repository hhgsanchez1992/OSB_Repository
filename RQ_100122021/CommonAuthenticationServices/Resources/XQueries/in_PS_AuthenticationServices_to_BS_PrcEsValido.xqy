xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/mobile/common/aplicationIntegration/CON/AuthenticationServices/V1.0";
(:: import schema at "../Schemas/WSAuthenticationServicesV1.0.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_PRC_WS_ES_VALIDO";
(:: import schema at "../Schemas/BS_PRC_WS_ES_VALIDO_sp.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:AuthenticationServicesRequest) ::) external;

declare function local:func(                                                        $input as element() (:: schema-element(ns1:AuthenticationServicesRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:IN_CANAL>{string($input//*:HeaderRequest/*:system)}</ns2:IN_CANAL>
        <ns2:IN_USUARIO>{string($input//*:HeaderRequest/*:user)}</ns2:IN_USUARIO>
        <ns2:IN_CLAVE>{string($input//*:HeaderRequest/*:password)}</ns2:IN_CLAVE>
        <ns2:IN_SERVICIO>{fn:substring-before(fn:substring-after(string($input//*:endpoint/*:transport/*:uri), '/'), '/')}</ns2:IN_SERVICIO>
        <ns2:IN_PLATAFORMA>{string($input//*:HeaderRequest/*:application)}</ns2:IN_PLATAFORMA>
        <ns2:IN_IP>{string($input//*:endpoint/*:transport/*:request/*:client-address)}</ns2:IN_IP>
    </ns2:InputParameters>
};

local:func($input)