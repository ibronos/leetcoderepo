/**
 * @param {number} n
 * @return {boolean}
 */
var canAliceWin = function(n) {

    let player = 'Alice';
    let number = n;
    let isAliceCorrect = false;

    for (let i = 10; i > 0; i--) {

        if ( number >= i ) {

            number = number - i; 

            if ( player == 'Alice' ) {
                isAliceCorrect = true;
                player = 'Bob';
            } else {
                isAliceCorrect = false;
                player = 'Alice';
            } 

        } 
        else {
            break;
        }


    }

    return isAliceCorrect;
    
};
