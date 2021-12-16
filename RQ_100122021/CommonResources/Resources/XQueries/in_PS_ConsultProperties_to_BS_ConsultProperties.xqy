xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/CO/Schema/ConsultProperties/v1";
(:: import schema at "../Schemas/ConsultPropertiesV1.0.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_ConsultProperties_JCA";
(:: import schema at "../Schemas/BS_ConsultProperties_JCA_sp.xsd" ::)

declare variable $request as element() (:: schema-element(ns1:ConsultPropertiesRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:ConsultPropertiesRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_FILTERBY>{fn:data($request/ns1:filterBy)}</ns2:P_FILTERBY>
        <ns2:P_FILTERVALUE>{fn:data($request/ns1:filterValue)}</ns2:P_FILTERVALUE>
        {
            if ($request/ns1:updateBusiness)
            then <ns2:P_UPDATEBUSSINES>{fn:data($request/ns1:updateBusiness)}</ns2:P_UPDATEBUSSINES>
            else ()
        }
    </ns2:InputParameters>
};

local:func($request)
