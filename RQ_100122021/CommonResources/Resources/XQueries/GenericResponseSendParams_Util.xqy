xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/integration/common/response/v1.0";
(:: import schema at "../Schemas/GenericResponseOSBV1.0.xsd" ::)

declare variable $code as xs:string external;
declare variable $description as xs:string external;
declare variable $body as element() external;

declare function local:func($code as xs:string, 
                            $description as xs:string, 
                            $body as element()) 
                            as element() (:: schema-element(ns1:PayloadRequest) ::) {
    <ns1:PayloadRequest>
        <ns1:code>{fn:data($code)}</ns1:code>
        <ns1:description>{fn:data($description)}</ns1:description>
        <ns1:body>{$body}</ns1:body>
    </ns1:PayloadRequest>
};

local:func($code, $description, $body)