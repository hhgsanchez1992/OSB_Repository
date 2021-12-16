xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/mobile/aplicationIntegration/CON/RegistryAudit/v1.0";
(:: import schema at "../Schemas/RegistryAuditV1.0.xsd" ::)

declare variable $tableName as xs:string external;
declare variable $schema as xs:string external;
declare variable $transactionId as xs:string external;
declare variable $operationName as xs:string external;
declare variable $request as xs:string external;
declare variable $response as xs:string external;
declare variable $dateIni as xs:dateTime external;
declare variable $dateEnd as xs:dateTime external;
declare variable $levelLog as xs:string external;
declare variable $message as xs:string external;
declare variable $channel as xs:string external;

declare function local:func($tableName as xs:string,
                            $schema as xs:string,
                            $transactionId as xs:string, 
                            $operationName as xs:string, 
                            $request as xs:string,
                            $response as xs:string,
                            $dateIni as xs:dateTime, 
                            $dateEnd as xs:dateTime, 
                            $levelLog as xs:string, 
                            $message as xs:string, 
                            $channel as xs:string) 
                            as element() (:: schema-element(ns1:RegistryAuditRequest) ::) {
    <ns1:RegistryAuditRequest>
        <ns1:tableName>{fn:data($tableName)}</ns1:tableName>
        <ns1:schema>{fn:data($schema)}</ns1:schema>
        <ns1:transactionId>{fn:data($transactionId)}</ns1:transactionId>
        <ns1:operationName>{fn:data($operationName)}</ns1:operationName>
        <ns1:request>{fn:data($request)}</ns1:request>
        <ns1:response>{fn:data($response)}</ns1:response>
        <ns1:dateIni>{fn:data($dateIni)}</ns1:dateIni>
        <ns1:dateEnd>{fn:data($dateEnd)}</ns1:dateEnd>
        <ns1:levelLog>{fn:data($levelLog)}</ns1:levelLog>
        <ns1:message>{fn:data($message)}</ns1:message>
        <ns1:channel>{fn:data($channel)}</ns1:channel>
    </ns1:RegistryAuditRequest>
};

local:func($tableName, $schema, $transactionId, $operationName, $request, $response, $dateIni, $dateEnd, $levelLog, $message, $channel)