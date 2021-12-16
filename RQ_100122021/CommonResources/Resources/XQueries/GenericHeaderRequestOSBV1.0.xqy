xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/Schema/CommonHeaders/v1";
(:: import schema at "../Schemas/CommonHeadersV1.0.xsd" ::)

declare variable $header as element() external;
declare variable $inbound as element() external;

declare function local:func($header as element()) as element() (:: schema-element(ns1:HeaderRequest) ::) {
    <ns1:HeaderRequest>
        {
          if($header//*:transactionId)
          then(<ns1:transactionId>{fn:data($header//*:transactionId)}</ns1:transactionId>)
          else if($inbound//*:request/*:headers/*:user-header[@name='transactionId']/@value)
          then(<ns1:transactionId>{fn:data($inbound//*:request/*:headers/*:user-header[@name='transactionId']/@value)}</ns1:transactionId>)
          else()
        }
        {
          if($header//*:system)
          then(<ns1:system>{fn:data($header//*:system)}</ns1:system>)
          else if($inbound//*:request/*:headers/*:user-header[@name='system']/@value)
          then(<ns1:system>{fn:data($inbound//*:request/*:headers/*:user-header[@name='system']/@value)}</ns1:system>)
          else()
        }
        {
          if($header//*:target)
          then(<ns1:target>{fn:data($header//*:target)}</ns1:target>)
          else if($inbound//*:request/*:headers/*:user-header[@name='target']/@value)
          then(<ns1:target>{fn:data($inbound//*:request/*:headers/*:user-header[@name='target']/@value)}</ns1:target>)
          else()
        }
        {
          if($header//*:user)
          then(<ns1:user>{fn:data($header//*:user)}</ns1:user>)
          else if($inbound//*:request/*:headers/*:user-header[@name='user']/@value)
          then(<ns1:user>{fn:data($inbound//*:request/*:headers/*:user-header[@name='user']/@value)}</ns1:user>)
          else()
        }
        {
          if($header//*:password)
          then(<ns1:password>{fn:data($header//*:password)}</ns1:password>)
          else if($inbound//*:request/*:headers/*:user-header[@name='password']/@value)
          then(<ns1:password>{fn:data($inbound//*:request/*:headers/*:user-header[@name='password']/@value)}</ns1:password>)
          else()
        }
        {
          if($header//*:requestDate)
          then(<ns1:requestDate>{fn:data($header//*:requestDate)}</ns1:requestDate>)
          else if($inbound//*:request/*:headers/*:user-header[@name='requestDate']/@value)
          then(<ns1:requestDate>{fn:data($inbound//*:request/*:headers/*:user-header[@name='requestDate']/@value)}</ns1:requestDate>)
          else()
        }
        {
          if($header//*:ipApplication)
          then(<ns1:ipApplication>{fn:data($header//*:ipApplication)}</ns1:ipApplication>)
          else if($inbound//*:request/*:headers/*:user-header[@name='ipApplication']/@value)
          then(<ns1:ipApplication>{fn:data($inbound//*:request/*:headers/*:user-header[@name='ipApplication']/@value)}</ns1:ipApplication>)
          else()
        }
        {
          if($header//*:traceabilityId)
          then(<ns1:traceabilityId>{fn:data($header//*:traceabilityId)}</ns1:traceabilityId>)
          else if($inbound//*:request/*:headers/*:user-header[@name='traceabilityId']/@value)
          then(<ns1:traceabilityId>{fn:data($inbound//*:request/*:headers/*:user-header[@name='traceabilityId']/@value)}</ns1:traceabilityId>)
          else()
        }
        {
          if($header//*:application)
          then(<ns1:application>{fn:data($header//*:application)}</ns1:application>)
          else if($inbound//*:request/*:headers/*:user-header[@name='application']/@value)
          then(<ns1:application>{fn:data($inbound//*:request/*:headers/*:user-header[@name='application']/@value)}</ns1:application>)
          else()
        }
    </ns1:HeaderRequest>
};

local:func($header)
