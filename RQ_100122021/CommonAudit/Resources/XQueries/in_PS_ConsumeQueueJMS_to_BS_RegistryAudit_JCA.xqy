xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/co/schema/mobile/aplicationIntegration/CON/RegistryAudit/v1.0";
(:: import schema at "../Schemas/RegistryAuditV1.0.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_RegitryAuditPesblogo_JCA";
(:: import schema at "../Schemas/BS_RegistryAudit_JCA_sp.xsd" ::)

declare variable $request as element() (:: schema-element(ns1:registryAuditRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:registryAuditRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        {
            if ($request/ns1:tableName)
            then <ns2:P_TABLE_NAME>{fn:data($request/ns1:tableName)}</ns2:P_TABLE_NAME>
            else ()
        }
        {
            if ($request/ns1:schema)
            then <ns2:P_SCHEMA>{fn:data($request/ns1:schema)}</ns2:P_SCHEMA>
            else ()
        }
        {
            if ($request/ns1:transactionId)
            then <ns2:P_TRANSACTION_ID>{fn:data($request/ns1:transactionId)}</ns2:P_TRANSACTION_ID>
            else ()
        }
        {
            if ($request/ns1:operationName)
            then <ns2:P_OPERATION_NAME>{fn:data($request/ns1:operationName)}</ns2:P_OPERATION_NAME>
            else ()
        }
        {
            if ($request/ns1:request)
            then <ns2:P_REQUEST>{fn:data($request/ns1:request)}</ns2:P_REQUEST>
            else ()
        }
        {
            if ($request/ns1:response)
            then <ns2:P_RESPONSE>{fn:data($request/ns1:response)}</ns2:P_RESPONSE>
            else ()
        }
        {
            if ($request/ns1:dateIni)
            then <ns2:P_DATE_INI>{fn:data($request/ns1:dateIni)}</ns2:P_DATE_INI>
            else ()
        }
        {
            if ($request/ns1:dateEnd)
            then <ns2:P_DATE_END>{fn:data($request/ns1:dateEnd)}</ns2:P_DATE_END>
            else ()
        }
        {
            if ($request/ns1:levelLog)
            then <ns2:P_LEVEL_LOG>{fn:data($request/ns1:levelLog)}</ns2:P_LEVEL_LOG>
            else ()
        }
        {
            if ($request/ns1:message)
            then <ns2:P_MESSAGE>{fn:data($request/ns1:message)}</ns2:P_MESSAGE>
            else ()
        }
        {
            if ($request/ns1:channel)
            then <ns2:P_CHANNEL>{fn:data($request/ns1:channel)}</ns2:P_CHANNEL>
            else ()
        }
    </ns2:InputParameters>
};

local:func($request)