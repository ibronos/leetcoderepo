class Solution {

    /**
     * @param String $s
     * @return Boolean
     */
    function checkString($s) {

        $result = true;
        if( str_contains($s, "a") === true && str_contains($s, "ba") === true ) {
            $result = false;
        }


        return $result;
        
    }
}
