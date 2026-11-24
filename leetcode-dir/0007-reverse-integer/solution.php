class Solution {

    /**
     * @param Integer $x
     * @return Integer
     */
    function reverse($x) {
        $minVal = -2 ** 31;
        $maxVal = 2 ** 31 - 1;
        $result = null;

        if ( $x <= $maxVal && $x >= $minVal ) {
            if ( $x < 0 ) { 
                $convert = abs($x);
                $reverse = strrev($convert);
                $result = $reverse * -1;
            } else {
                $result = strrev($x);
            }
        }

         if ( $result > $maxVal || $result < $minVal ) {
            $result = 0; 
         }


        return (int)$result;
    }
}
