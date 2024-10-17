/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["1", "0"]
 * }
 *
 */

#include "cminus.h"

void main() {
    int x = 0 ;
    
    {
        int x = 1 ;
        print_int(x) ;
    }

    print_int(x) ;

    return ;

}
