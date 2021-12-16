xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $input as element() external;

declare function local:change-ns($input as element()) as element() {
    
    element {fn:local-name($input) }
    {
    for $child in $input/(@*,node())
      return
      if ($child instance of element())
        then local:change-ns($child)
      else $child
    }
};
local:change-ns($input)