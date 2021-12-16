xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/integration/common/response/v1.0";
(:: import schema at "../Schemas/GenericResponseOSBV1.0.xsd" ::)

declare variable $request as element() (:: schema-element(ns1:PayloadRequest) ::) external;


declare function local:func($request as element() (:: schema-element(ns1:PayloadRequest) ::)) as element() (:: schema-element(ns1:Payload) ::) {
    if(string-length(string($request/*:code)) > 0
    and string-length(string($request/*:description)) > 0)
    then(
      <ns1:Payload>
          <ns1:code>{fn:data($request/*:code)}</ns1:code>
          <ns1:description>{fn:data($request/*:description)}</ns1:description>
          {
              if (string-length(string($request/*:body)) > 7)
              then <ns1:detail>{$request/*:body/*}</ns1:detail>
              else ()
          }
      </ns1:Payload>
      )
    else if(string-length(string($request/*:body/*:Payload)) > 0)
    then(
      <ns1:Payload>
          <ns1:code>{fn:data($request/*:body/*:Payload/*:code)}</ns1:code>
          <ns1:description>{fn:data($request/*:body/*:Payload/*:description)}</ns1:description>
          {
              if (string-length(string($request/*:body/*:Payload/*:detail)) > 0)
              then <ns1:detail>{$request/*:body/*:Payload/*:detail/*}</ns1:detail>
              else ()
          }
      </ns1:Payload>
    )
    else(
      <ns1:Payload>
          <ns1:code>{fn:data($request/*:body/*:Fault//*:FaultMessage/*:errorcode)}</ns1:code>
          <ns1:description>{fn:data($request/*:body/*:Fault//*:faultstring)}</ns1:description>
          {
              if (string-length(string($request/*:body/*:Fault/*:detail)) > 0)
              then <ns1:detail>{$request/*:body/*:Fault/*:detail/*:FaultMessage/*}</ns1:detail>
              else ()
          }
      </ns1:Payload>
    )
};

local:func($request)