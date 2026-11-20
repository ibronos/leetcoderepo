class Solution {

    /**
     * @param Integer $x
     * @return Boolean
     */
    function isPalindrome($x) {

       $chars = str_split($x);
       $size = count($chars);
       $result = true;
       $lastChar = $size -1;

       foreach ($chars as $index => $char) {
           if( $char != $chars[$lastChar] ){
               
                $result = false;
           }
           $lastChar--;
       }

       return $result;

    }

}
