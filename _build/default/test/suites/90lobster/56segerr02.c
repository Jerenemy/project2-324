/*!tests!
 *
 * {
 *    "input":      [],
 *    "exception":  "SegmentationError"
 * }
 *
 */

#include "cminus.h"

void main() {
    int xs [1] ;
    xs[0] = 1 ;
    int x = xs[-1] ;
    /*
    
    print_int(xs[-1]) ;
    */    return ;
}

