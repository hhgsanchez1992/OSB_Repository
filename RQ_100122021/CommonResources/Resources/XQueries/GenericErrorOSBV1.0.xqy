xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace soapenv="http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ctx="http://www.bea.com/wli/sb/context";
declare namespace ns2="http://www.amx.com/co/schema/mobile/common/aplicationIntegration/Comunes/v1.0";
(:: import schema at "../Schemas/GenericErrorOSBV1.0.xsd" ::)

declare variable $fault as element() external;
declare variable $body as element() external;
declare variable $layer as xs:string external;
declare variable $legacySystem as xs:string external;

declare function local:func($fault as element(), 
                            $body as element(),
                            $layer as xs:string,
                            $legacySystem as xs:string) as element() {
      
        if($body/*:Fault/*:detail/*:FaultMessage)
        then(
            <soapenv:Fault>
                <faultcode>{data($body/*:Fault/*:faultcode)}</faultcode>
                <faultstring>{data($body/*:Fault/*:faultstring)}</faultstring>
                <detail>
                  <ns2:FaultMessage>
                    <ns2:errorcode>
                      {data($body/*:Fault/*:detail/*:FaultMessage/*:errorcode)}
                    </ns2:errorcode>
                  <ns2:description>
                      {data($body/*:Fault/*:detail/*:FaultMessage/*:description)}
                  </ns2:description>
                  <ns2:severity>{'ERROR'}</ns2:severity>
                  <ns2:location>
                      <ns2:node>{data($fault/*:location/*:node)}</ns2:node>
                      <ns2:pipeline>{data($fault/*:location/*:pipeline)}</ns2:pipeline>
                      <ns2:stage>{data($fault/*:location/*:stage)}</ns2:stage>
                      <ns2:path>{data($fault/*:location/*:path)}</ns2:path>
                      <ns2:originError>
                        <ns2:layer>{data($body/*:Fault/*:detail/*:FaultMessage/*:location/*:originError/*:layer)}</ns2:layer>
                        <ns2:stage>{data($body/*:Fault/*:detail/*:FaultMessage/*:location/*:originError/*:stage)}</ns2:stage>
                      </ns2:originError>
                  </ns2:location>              
                </ns2:FaultMessage>
              </detail>
          </soapenv:Fault>
        )else if($fault//*:detail/*:FaultMessage)
        then(
            <soapenv:Fault>
                <faultcode>{data($fault//*:faultcode)}</faultcode>
                <faultstring>{data($fault//*:faultstring)}</faultstring>
                <detail>
                  <ns2:FaultMessage>
                    <ns2:errorcode>
                      {data($fault//*:detail/*:FaultMessage/*:errorcode)}
                    </ns2:errorcode>
                  <ns2:description>
                      {data($fault//*:detail/*:FaultMessage/*:description)}
                  </ns2:description>
                  <ns2:severity>{'ERROR'}</ns2:severity>
                  <ns2:location>
                      <ns2:node>{data($fault/*:location/*:node)}</ns2:node>
                      <ns2:pipeline>{data($fault/*:location/*:pipeline)}</ns2:pipeline>
                      <ns2:stage>{data($fault/*:location/*:stage)}</ns2:stage>
                      <ns2:path>{data($fault/*:location/*:path)}</ns2:path>
                      <ns2:originError>
                        <ns2:layer>{data($fault//*:detail/*:FaultMessage/*:location/*:originError/*:layer)}</ns2:layer>
                        <ns2:stage>{data($fault//*:detail/*:FaultMessage/*:location/*:originError/*:stage)}</ns2:stage>
                      </ns2:originError>
                  </ns2:location>              
                </ns2:FaultMessage>
              </detail>
          </soapenv:Fault>
        )
        else(
          <soapenv:Fault>
              {
                if($fault/*:errorCode/text() = 'OSB-380002')
                then(<faultcode>{concat('ERR_', '92')}</faultcode>)
                else if($fault/*:errorCode/text() = 'OSB-380000')
                then(
                  <faultcode>{concat('ERR_', '93')}</faultcode>
                )
                else if($fault/*:errorCode/text() = 'OSB-380001'
                or $fault/*:errorCode/text() = 'OSB-380003' or $fault/*:errorCode/text() = 'OSB-380004'
                or $fault/*:errorCode/text() = 'OSB-380006' or $fault/*:errorCode/text() = 'OSB-380008'
                or $fault/*:errorCode/text() = 'OSB-380009' or $fault/*:errorCode/text() = 'OSB-380010'
                or $fault/*:errorCode/text() = 'OSB-380011' or $fault/*:errorCode/text() = 'OSB-380012'
                or $fault/*:errorCode/text() = 'OSB-380013' or $fault/*:errorCode/text() = 'OSB-380014'
                or $fault/*:errorCode/text() = 'OSB-380015' or $fault/*:errorCode/text() = 'OSB-380016'
                or $fault/*:errorCode/text() = 'OSB-380017' or $fault/*:errorCode/text() = 'OSB-380018'
                or $fault/*:errorCode/text() = 'OSB-380019' or $fault/*:errorCode/text() = 'OSB-380020'
                or $fault/*:errorCode/text() = 'OSB-381019' or $fault/*:errorCode/text() = 'OSB-381038' 
                or $fault/*:errorCode/text() = 'OSB-381040' or $fault/*:errorCode/text() = 'OSB-381202'
                or $fault/*:errorCode/text() = 'OSB-382500' or $fault/*:errorCode/text() = 'OSB-382501' 
                or $fault/*:errorCode/text() = 'OSB-382502' or $fault/*:errorCode/text() = 'OSB-381965'
                or $fault/*:errorCode/text() = 'OSB-382603' or $fault/*:errorCode/text() = 'OSB-382604'
                or $fault/*:errorCode/text() = 'OSB-382614' or $fault/*:errorCode/text() = 'OSB-386000'
                or $fault/*:errorCode/text() = 'OSB-386001' or $fault/*:errorCode/text() = 'OSB-386002'
                or $fault/*:errorCode/text() = 'OSB-386003' or $fault/*:errorCode/text() = 'OSB-386004'
                or $fault/*:errorCode/text() = 'OSB-386005' or $fault/*:errorCode/text() = 'OSB-386006'
                or $fault/*:errorCode/text() = 'OSB-386007' or $fault/*:errorCode/text() = 'OSB-386008'
                or $fault/*:errorCode/text() = 'OSB-386009' or $fault/*:errorCode/text() = 'OSB-386010'
                )
                then(
                  <faultcode>{concat('ERR_', '94')}</faultcode>
                )else if($fault/*:errorCode/text() = 'OSB-382505')
                then(
                  <faultcode>{concat('ERR_', '95')}</faultcode>
                )
                else if($fault/*:errorCode/text() = 'OSB-382510' or $fault/*:errorCode/text() = 'OSB-382511'
                or $fault/*:errorCode/text() = 'OSB-382512' or $fault/*:errorCode/text() = 'OSB-382513'
                or $fault/*:errorCode/text() = 'OSB-382514' or $fault/*:errorCode/text() = 'OSB-382515' 
                or $fault/*:errorCode/text() = 'OSB-382516' or $fault/*:errorCode/text() = 'OSB-382517' 
                or $fault/*:errorCode/text() = 'OSB-382518' or $fault/*:errorCode/text() = 'OSB-382519' 
                or $fault/*:errorCode/text() = 'OSB-382520' or $fault/*:errorCode/text() = 'OSB-382521' 
                or $fault/*:errorCode/text() = 'OSB-382522' or $fault/*:errorCode/text() = 'OSB-382523'
                or $fault/*:errorCode/text() = 'OSB-382524' or $fault/*:errorCode/text() = 'OSB-382525'
                or $fault/*:errorCode/text() = 'OSB-382526' or $fault/*:errorCode/text() = 'OSB-382527'
                or $fault/*:errorCode/text() = 'OSB-382528' or $fault/*:errorCode/text() = 'OSB-382529'
                or $fault/*:errorCode/text() = 'OSB-382030' or $fault/*:errorCode/text() = 'OSB-382031' 
                or $fault/*:errorCode/text() = 'OSB-382032' or $fault/*:errorCode/text() = 'OSB-382033'
                or $fault/*:errorCode/text() = 'OSB-382034' or $fault/*:errorCode/text() = 'OSB-382035'
                or $fault/*:errorCode/text() = 'OSB-382036' or $fault/*:errorCode/text() = 'OSB-382543'
                or $fault/*:errorCode/text() = 'OSB-382544' or $fault/*:errorCode/text() = 'OSB-382545'
                or $fault/*:errorCode/text() = 'OSB-382546' or $fault/*:errorCode/text() = 'OSB-382547'
                or $fault/*:errorCode/text() = 'OSB-382551' or $fault/*:errorCode/text() = 'OSB-382552'
                or $fault/*:errorCode/text() = 'OSB-382553' or $fault/*:errorCode/text() = 'OSB-382554'
                or $fault/*:errorCode/text() = 'OSB-382555' or $fault/*:errorCode/text() = 'OSB-382556'
                or $fault/*:errorCode/text() = 'OSB-382557' or $fault/*:errorCode/text() = 'OSB-382558'
                or $fault/*:errorCode/text() = 'OSB-382559' or $fault/*:errorCode/text() = 'OSB-382560'
                or $fault/*:errorCode/text() = 'OSB-382561' or $fault/*:errorCode/text() = 'OSB-382562'
                or $fault/*:errorCode/text() = 'OSB-382563' or $fault/*:errorCode/text() = 'OSB-382564'
                or $fault/*:errorCode/text() = 'OSB-382565' or $fault/*:errorCode/text() = 'OSB-382566'
                or $fault/*:errorCode/text() = 'OSB-382610' or $fault/*:errorCode/text() = 'OSB-383519'
                or $fault/*:errorCode/text() = 'OSB-383520' or $fault/*:errorCode/text() = 'OSB-383521'
                or $fault/*:errorCode/text() = 'OSB-383522' or $fault/*:errorCode/text() = 'OSB-383523'
                or $fault/*:errorCode/text() = 'OSB-383524' or $fault/*:errorCode/text() = 'OSB-383525'
                )
                then(
                  <faultcode>{concat('ERR_', '96')}</faultcode>
                )
                else if($fault/*:errorCode/text() = 'BE-10000')
                then(
                  <faultcode>{concat('ERR_', '97')}</faultcode>
                ) 
                else if($fault/*:errorCode/text() = 'BE-10001')
                then(
                  <faultcode>{concat('ERR_', '98')}</faultcode>
                )
                else(<faultcode>{concat('ERR_', '99')}</faultcode>)
              }
              
              {
                if($fault/*:errorCode/text() = 'OSB-380002')
                then(
                  <faultstring>{concat('Connection timeout with ', $legacySystem)}</faultstring>
                )
                else if($fault/*:errorCode/text() = 'OSB-380000')
                then(
                  <faultstring>{'Unauthorized to consume legacy system'}</faultstring>
                )
                else if($fault/*:errorCode/text() = 'OSB-380001'
                or $fault/*:errorCode/text() = 'OSB-380003' or $fault/*:errorCode/text() = 'OSB-380004'
                or $fault/*:errorCode/text() = 'OSB-380006' or $fault/*:errorCode/text() = 'OSB-380008'
                or $fault/*:errorCode/text() = 'OSB-380009' or $fault/*:errorCode/text() = 'OSB-380010'
                or $fault/*:errorCode/text() = 'OSB-380011' or $fault/*:errorCode/text() = 'OSB-380012'
                or $fault/*:errorCode/text() = 'OSB-380013' or $fault/*:errorCode/text() = 'OSB-380014'
                or $fault/*:errorCode/text() = 'OSB-380015' or $fault/*:errorCode/text() = 'OSB-380016'
                or $fault/*:errorCode/text() = 'OSB-380017' or $fault/*:errorCode/text() = 'OSB-380018'
                or $fault/*:errorCode/text() = 'OSB-380019' or $fault/*:errorCode/text() = 'OSB-380020'
                or $fault/*:errorCode/text() = 'OSB-381019' or $fault/*:errorCode/text() = 'OSB-381038' 
                or $fault/*:errorCode/text() = 'OSB-381040' or $fault/*:errorCode/text() = 'OSB-381202'
                or $fault/*:errorCode/text() = 'OSB-382500' or $fault/*:errorCode/text() = 'OSB-382501' 
                or $fault/*:errorCode/text() = 'OSB-382502' or $fault/*:errorCode/text() = 'OSB-381965'
                or $fault/*:errorCode/text() = 'OSB-382603' or $fault/*:errorCode/text() = 'OSB-382604'
                or $fault/*:errorCode/text() = 'OSB-382614' or $fault/*:errorCode/text() = 'OSB-386000'
                or $fault/*:errorCode/text() = 'OSB-386001' or $fault/*:errorCode/text() = 'OSB-386002'
                or $fault/*:errorCode/text() = 'OSB-386003' or $fault/*:errorCode/text() = 'OSB-386004'
                or $fault/*:errorCode/text() = 'OSB-386005' or $fault/*:errorCode/text() = 'OSB-386006'
                or $fault/*:errorCode/text() = 'OSB-386007' or $fault/*:errorCode/text() = 'OSB-386008'
                or $fault/*:errorCode/text() = 'OSB-386009' or $fault/*:errorCode/text() = 'OSB-386010'
                )
                then(
                  <faultstring>{concat('Connection error with ', $legacySystem)}</faultstring>
                )else if($fault/*:errorCode/text() = 'OSB-382505')
                then(
                  <faultstring>{'Service request error'}</faultstring>
                )
                else if($fault/*:errorCode/text() = 'OSB-382510' or $fault/*:errorCode/text() = 'OSB-382511'
                or $fault/*:errorCode/text() = 'OSB-382512' or $fault/*:errorCode/text() = 'OSB-382513'
                or $fault/*:errorCode/text() = 'OSB-382514' or $fault/*:errorCode/text() = 'OSB-382515' 
                or $fault/*:errorCode/text() = 'OSB-382516' or $fault/*:errorCode/text() = 'OSB-382517' 
                or $fault/*:errorCode/text() = 'OSB-382518' or $fault/*:errorCode/text() = 'OSB-382519' 
                or $fault/*:errorCode/text() = 'OSB-382520' or $fault/*:errorCode/text() = 'OSB-382521' 
                or $fault/*:errorCode/text() = 'OSB-382522' or $fault/*:errorCode/text() = 'OSB-382523'
                or $fault/*:errorCode/text() = 'OSB-382524' or $fault/*:errorCode/text() = 'OSB-382525'
                or $fault/*:errorCode/text() = 'OSB-382526' or $fault/*:errorCode/text() = 'OSB-382527'
                or $fault/*:errorCode/text() = 'OSB-382528' or $fault/*:errorCode/text() = 'OSB-382529'
                or $fault/*:errorCode/text() = 'OSB-382030' or $fault/*:errorCode/text() = 'OSB-382031' 
                or $fault/*:errorCode/text() = 'OSB-382032' or $fault/*:errorCode/text() = 'OSB-382033'
                or $fault/*:errorCode/text() = 'OSB-382034' or $fault/*:errorCode/text() = 'OSB-382035'
                or $fault/*:errorCode/text() = 'OSB-382036' or $fault/*:errorCode/text() = 'OSB-382543'
                or $fault/*:errorCode/text() = 'OSB-382544' or $fault/*:errorCode/text() = 'OSB-382545'
                or $fault/*:errorCode/text() = 'OSB-382546' or $fault/*:errorCode/text() = 'OSB-382547'
                or $fault/*:errorCode/text() = 'OSB-382551' or $fault/*:errorCode/text() = 'OSB-382552'
                or $fault/*:errorCode/text() = 'OSB-382553' or $fault/*:errorCode/text() = 'OSB-382554'
                or $fault/*:errorCode/text() = 'OSB-382555' or $fault/*:errorCode/text() = 'OSB-382556'
                or $fault/*:errorCode/text() = 'OSB-382557' or $fault/*:errorCode/text() = 'OSB-382558'
                or $fault/*:errorCode/text() = 'OSB-382559' or $fault/*:errorCode/text() = 'OSB-382560'
                or $fault/*:errorCode/text() = 'OSB-382561' or $fault/*:errorCode/text() = 'OSB-382562'
                or $fault/*:errorCode/text() = 'OSB-382563' or $fault/*:errorCode/text() = 'OSB-382564'
                or $fault/*:errorCode/text() = 'OSB-382565' or $fault/*:errorCode/text() = 'OSB-382566'
                or $fault/*:errorCode/text() = 'OSB-382610' or $fault/*:errorCode/text() = 'OSB-383519'
                or $fault/*:errorCode/text() = 'OSB-383520' or $fault/*:errorCode/text() = 'OSB-383521'
                or $fault/*:errorCode/text() = 'OSB-383522' or $fault/*:errorCode/text() = 'OSB-383523'
                or $fault/*:errorCode/text() = 'OSB-383524' or $fault/*:errorCode/text() = 'OSB-383525'
                )
                then(
                  <faultstring>{'Field formatting error'}</faultstring>
                )
                else if($fault/*:errorCode/text() = 'BE-10000' or $fault/*:errorCode/text() = 'BE-10001')
                then(
                  <faultstring>{'Business error'}</faultstring>
                )
                else(<faultstring>{'Internal error'}</faultstring>)
              }
              <detail>
                <ns2:FaultMessage>
                  <ns2:errorcode>
                    {
                      if($fault/*:errorCode/text() = 'OSB-380002')
                      then('92')
                      else if($fault/*:errorCode/text() = 'OSB-380000')
                      then('93')
                      else if($fault/*:errorCode/text() = 'OSB-380001'
                      or $fault/*:errorCode/text() = 'OSB-380003' or $fault/*:errorCode/text() = 'OSB-380004'
                      or $fault/*:errorCode/text() = 'OSB-380006' or $fault/*:errorCode/text() = 'OSB-380008'
                      or $fault/*:errorCode/text() = 'OSB-380009' or $fault/*:errorCode/text() = 'OSB-380010'
                      or $fault/*:errorCode/text() = 'OSB-380011' or $fault/*:errorCode/text() = 'OSB-380012'
                      or $fault/*:errorCode/text() = 'OSB-380013' or $fault/*:errorCode/text() = 'OSB-380014'
                      or $fault/*:errorCode/text() = 'OSB-380015' or $fault/*:errorCode/text() = 'OSB-380016'
                      or $fault/*:errorCode/text() = 'OSB-380017' or $fault/*:errorCode/text() = 'OSB-380018'
                      or $fault/*:errorCode/text() = 'OSB-380019' or $fault/*:errorCode/text() = 'OSB-380020'
                      or $fault/*:errorCode/text() = 'OSB-381019' or $fault/*:errorCode/text() = 'OSB-381038' 
                      or $fault/*:errorCode/text() = 'OSB-381040' or $fault/*:errorCode/text() = 'OSB-381202'
                      or $fault/*:errorCode/text() = 'OSB-382500' or $fault/*:errorCode/text() = 'OSB-382501' 
                      or $fault/*:errorCode/text() = 'OSB-382502' or $fault/*:errorCode/text() = 'OSB-381965'
                      or $fault/*:errorCode/text() = 'OSB-382603' or $fault/*:errorCode/text() = 'OSB-382604'
                      or $fault/*:errorCode/text() = 'OSB-382614' or $fault/*:errorCode/text() = 'OSB-386000'
                      or $fault/*:errorCode/text() = 'OSB-386001' or $fault/*:errorCode/text() = 'OSB-386002'
                      or $fault/*:errorCode/text() = 'OSB-386003' or $fault/*:errorCode/text() = 'OSB-386004'
                      or $fault/*:errorCode/text() = 'OSB-386005' or $fault/*:errorCode/text() = 'OSB-386006'
                      or $fault/*:errorCode/text() = 'OSB-386007' or $fault/*:errorCode/text() = 'OSB-386008'
                      or $fault/*:errorCode/text() = 'OSB-386009' or $fault/*:errorCode/text() = 'OSB-386010'
                      )
                      then('94')
                      else if($fault/*:errorCode/text() = 'OSB-382505')
                      then('95')
                      else if($fault/*:errorCode/text() = 'OSB-382510' or $fault/*:errorCode/text() = 'OSB-382511'
                      or $fault/*:errorCode/text() = 'OSB-382512' or $fault/*:errorCode/text() = 'OSB-382513'
                      or $fault/*:errorCode/text() = 'OSB-382514' or $fault/*:errorCode/text() = 'OSB-382515' 
                      or $fault/*:errorCode/text() = 'OSB-382516' or $fault/*:errorCode/text() = 'OSB-382517' 
                      or $fault/*:errorCode/text() = 'OSB-382518' or $fault/*:errorCode/text() = 'OSB-382519' 
                      or $fault/*:errorCode/text() = 'OSB-382520' or $fault/*:errorCode/text() = 'OSB-382521' 
                      or $fault/*:errorCode/text() = 'OSB-382522' or $fault/*:errorCode/text() = 'OSB-382523'
                      or $fault/*:errorCode/text() = 'OSB-382524' or $fault/*:errorCode/text() = 'OSB-382525'
                      or $fault/*:errorCode/text() = 'OSB-382526' or $fault/*:errorCode/text() = 'OSB-382527'
                      or $fault/*:errorCode/text() = 'OSB-382528' or $fault/*:errorCode/text() = 'OSB-382529'
                      or $fault/*:errorCode/text() = 'OSB-382030' or $fault/*:errorCode/text() = 'OSB-382031' 
                      or $fault/*:errorCode/text() = 'OSB-382032' or $fault/*:errorCode/text() = 'OSB-382033'
                      or $fault/*:errorCode/text() = 'OSB-382034' or $fault/*:errorCode/text() = 'OSB-382035'
                      or $fault/*:errorCode/text() = 'OSB-382036' or $fault/*:errorCode/text() = 'OSB-382543'
                      or $fault/*:errorCode/text() = 'OSB-382544' or $fault/*:errorCode/text() = 'OSB-382545'
                      or $fault/*:errorCode/text() = 'OSB-382546' or $fault/*:errorCode/text() = 'OSB-382547'
                      or $fault/*:errorCode/text() = 'OSB-382551' or $fault/*:errorCode/text() = 'OSB-382552'
                      or $fault/*:errorCode/text() = 'OSB-382553' or $fault/*:errorCode/text() = 'OSB-382554'
                      or $fault/*:errorCode/text() = 'OSB-382555' or $fault/*:errorCode/text() = 'OSB-382556'
                      or $fault/*:errorCode/text() = 'OSB-382557' or $fault/*:errorCode/text() = 'OSB-382558'
                      or $fault/*:errorCode/text() = 'OSB-382559' or $fault/*:errorCode/text() = 'OSB-382560'
                      or $fault/*:errorCode/text() = 'OSB-382561' or $fault/*:errorCode/text() = 'OSB-382562'
                      or $fault/*:errorCode/text() = 'OSB-382563' or $fault/*:errorCode/text() = 'OSB-382564'
                      or $fault/*:errorCode/text() = 'OSB-382565' or $fault/*:errorCode/text() = 'OSB-382566'
                      or $fault/*:errorCode/text() = 'OSB-382610' or $fault/*:errorCode/text() = 'OSB-383519'
                      or $fault/*:errorCode/text() = 'OSB-383520' or $fault/*:errorCode/text() = 'OSB-383521'
                      or $fault/*:errorCode/text() = 'OSB-383522' or $fault/*:errorCode/text() = 'OSB-383523'
                      or $fault/*:errorCode/text() = 'OSB-383524' or $fault/*:errorCode/text() = 'OSB-383525'
                      )
                      then('96')
                      else if($fault/*:errorCode/text() = 'BE-10000')
                      then('97')
                      else if($fault/*:errorCode/text() = 'BE-10001')
                      then('98')
                      else('99')                      
                    }
                    </ns2:errorcode>
                  <ns2:description>
                    {
                      if($body/*:Fault/*:detail/*:FaultMessage/*:description)
                      then
                        $body/*:Fault/*:detail/*:FaultMessage/*:description/text()
                      else if($body/*:Fault/*:detail//*:reason)
                      then
                        $body/*:Fault/*:detail//*:reason/text()
                      else if($body/*:Fault/*:detail//*:exception)
                      then
                        $body/*:Fault/*:detail//*:exception/text()
                      else if($body/*:Fault/*:detail//*:excepcion)
                      then
                        $body/*:Fault/*:detail//*:excepcion/text()  
                      else if($body/*:Fault/*:detail//*:eis-error-message)
                      then
                        $body/*:Fault/*:detail//*:eis-error-message/text()  
                      else if($body/*:Fault/*:detail//*:faultstring)
                      then($body/*:Fault/*:detail//*:faultstring/text())
                      else if($fault/*:detail/*:FaultMessage/*:description)
                      then
                        $fault/*:detail/*:FaultMessage/*:description/text()
                      else if($fault/*:detail//*:reason)
                      then
                        $fault/*:detail//*:reason/text()
                      else if($fault//*:message/text())
                      then
                        $fault//*:message/text()
                      else if($fault//*:faultstring/text())
                      then
                        $fault//*:faultstring/text()
                      else
                        $fault/*:reason/text()
                        
                    }
                  </ns2:description>
                  <ns2:severity>{'ERROR'}</ns2:severity>
                 {
                    <ns2:location>
                      {
                        if($body/*:Fault/*:detail/*:FaultMessage/*:location/*:node)
                        then(<ns2:node>{$body/*:Fault/*:detail/*:FaultMessage/*:location/*:node/text()}</ns2:node>)
                        else(<ns2:node>{data($fault/*:location/*:node)}</ns2:node>)
                      }
                      {
                        if($body/*:Fault/*:detail/*:FaultMessage/*:location/*:pipeline)
                        then(<ns2:pipeline>{$body/*:Fault/*:detail/*:FaultMessage/*:location/*:pipeline/text()}</ns2:pipeline>)
                        else(<ns2:pipeline>{data($fault/*:location/*:pipeline)}</ns2:pipeline>)
                      }                  
                      {
                        if($body/*:Fault/*:detail/*:FaultMessage/*:location/*:stage)
                        then(<ns2:stage>{data($body/*:Fault/*:detail/*:FaultMessage/*:location/*:stage)}</ns2:stage>)
                        else(<ns2:stage>{data($fault/*:location/*:stage)}</ns2:stage>)
                      }                    
                      {
                        if($body/*:Fault/*:detail/*:FaultMessage/*:location/*:path)
                        then(<ns2:path>{data($body/*:Fault/*:detail/*:FaultMessage/*:location/*:path)}</ns2:path>)
                        else(<ns2:path>{data($fault/*:location/*:path)}</ns2:path>)
                      }           
                      <ns2:originError>
                        <ns2:layer>{$layer}</ns2:layer>
                        <ns2:stage>{data($fault/*:location/*:stage)}</ns2:stage>
                      </ns2:originError>
                    </ns2:location>              
                  }   
                </ns2:FaultMessage>
              </detail>
          </soapenv:Fault>
        )
        
 };

local:func($fault, $body, $layer, $legacySystem)