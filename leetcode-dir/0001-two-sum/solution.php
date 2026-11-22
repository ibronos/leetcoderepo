class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    function twoSum($nums, $target) {

        $result = [];
        $isBreak = false;

        foreach($nums as $x => $n1) {

            if( $isBreak === false ){ 

                foreach( $nums as $y => $n2 ){ 
                    $sum = $n1 + $n2;
                    if( $sum == $target && $x != $y){ 
                        array_push($result, $x , $y );
                        $isBreak = true;
                    }
                }

            }

        }

        return $result;

    }
}
