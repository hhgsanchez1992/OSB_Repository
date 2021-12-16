xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.amx.com/CO/Schema/ConsultProperties/v1";
(:: import schema at "../Schemas/ConsultPropertiesV1.0.xsd" ::)

declare variable $filterBy as xs:string external;
declare variable $filterValue as xs:string external;
declare variable $updateBusiness as xs:string external;

declare function local:func($filterBy as xs:string, 
                            $filterValue as xs:string, 
                            $updateBusiness as xs:string) 
                            as element() (:: schema-element(ns1:ConsultPropertiesRequest) ::) {
    <ns1:ConsultPropertiesRequest>
        <ns1:filterBy>{fn:data($filterBy)}</ns1:filterBy>
        <ns1:filterValue>{fn:data($filterValue)}</ns1:filterValue>
        {
          if(string-length(string($updateBusiness)) > 0)
          then(<ns1:updateBusiness>{fn:data($updateBusiness)}</ns1:updateBusiness>)
          else()
        }
    </ns1:ConsultPropertiesRequest>
};

local:func($filterBy, $filterValue, $updateBusiness)
