xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/mobile/aplicationIntegration/CON/RegistryAudit/v1.0";
(:: import schema at "../Schemas/RegistryAuditV1.0.xsd" ::)

declare variable $request as element() (:: schema-element(ns1:RegistryAuditRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:RegistryAuditRequest) ::)) as element() (:: schema-element(ns1:RegistryAuditRequest) ::) {
    <ns1:RegistryAuditRequest>
        {
            if ($request/ns1:tableName)
            then <ns1:tableName>{fn:data($request/ns1:tableName)}</ns1:tableName>
            else ()
        }
        {
            if ($request/ns1:schema)
            then <ns1:schema>{fn:data($request/ns1:schema)}</ns1:schema>
            else ()
        }
        {
            if ($request/ns1:transactionId)
            then <ns1:transactionId>{fn:data($request/ns1:transactionId)}</ns1:transactionId>
            else ()
        }
        {
            if ($request/ns1:operationName)
            then <ns1:operationName>{fn:data($request/ns1:operationName)}</ns1:operationName>
            else ()
        }
        {
            if ($request/ns1:request)
            then <ns1:request>{fn:data($request/ns1:request)}</ns1:request>
            else ()
        }
        {
            if ($request/ns1:response)
            then <ns1:response>{fn:data($request/ns1:response)}</ns1:response>
            else ()
        }
        {
            if ($request/ns1:dateIni)
            then <ns1:dateIni>{fn:data($request/ns1:dateIni)}</ns1:dateIni>
            else ()
        }
        {
            if ($request/ns1:dateEnd)
            then <ns1:dateEnd>{fn:data($request/ns1:dateEnd)}</ns1:dateEnd>
            else ()
        }
        {
            if ($request/ns1:levelLog)
            then <ns1:levelLog>{fn:data($request/ns1:levelLog)}</ns1:levelLog>
            else ()
        }
        {
            if ($request/ns1:message)
            then <ns1:message>{fn:data($request/ns1:message)}</ns1:message>
            else ()
        }
        {
            if ($request/ns1:channel)
            then <ns1:channel>{fn:data($request/ns1:channel)}</ns1:channel>
            else ()
        }
    </ns1:RegistryAuditRequest>
};

local:func($request)