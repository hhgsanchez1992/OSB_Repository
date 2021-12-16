xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ctx="http://www.bea.com/wli/sb/context";
declare namespace ns1="http://www.amx.com/co/Schema/CommonHeaders/v1";
(:: import schema at "../Schemas/CommonHeadersV1.0.xsd" ::)

declare variable $type as xs:string external;
declare variable $codeResponse as xs:string external;
declare variable $descResponse as xs:string external;
declare variable $traceabilityId as xs:string external;

declare function local:func($type as xs:string, 
                            $codeResponse as xs:string,
                            $descResponse as xs:string,
                            $traceabilityId as xs:string) 
                            as element() (:: schema-element(ns1:HeaderResponse) ::) {
    if(fn:lower-case($type) = 'error')
    then(
      <ns1:HeaderResponse>
        <ns1:statusCode>{'ERROR'}</ns1:statusCode>
        <ns1:statusDesc>{$descResponse}</ns1:statusDesc>
        <ns1:responseDate>{fn:current-dateTime()}</ns1:responseDate>
        <ns1:traceabilityId>{$traceabilityId}</ns1:traceabilityId>
        <ns1:headerError>
            <ns1:errorCode>{$codeResponse}</ns1:errorCode>
            <ns1:errorDescription>{$descResponse}</ns1:errorDescription>
            <ns1:errorType>{
              if($codeResponse = '92')
              then('Connection timeout')
              else if($codeResponse = '93')
              then('Unauthorized')
              else if($codeResponse = '94')
              then('Connection error')
              else if($codeResponse = '95')
              then('Service request error')
              else if($codeResponse = '96')
              then('Field formatting error')
              else if($codeResponse = '97' or $codeResponse = '98')
              then('Business error')
              else('Internal error')
            }</ns1:errorType>
        </ns1:headerError>
    </ns1:HeaderResponse>
    )
    else(
       <ns1:HeaderResponse>
          <ns1:statusCode>{'SUCCESS'}</ns1:statusCode>
          <ns1:statusDesc>{$descResponse}</ns1:statusDesc>
          <ns1:responseDate>{fn:current-dateTime()}</ns1:responseDate>
          <ns1:traceabilityId>{$traceabilityId}</ns1:traceabilityId>
      </ns1:HeaderResponse>
    )
};

local:func($type, $codeResponse, $descResponse, $traceabilityId)