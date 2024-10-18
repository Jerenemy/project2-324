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
    int xs[10] ;
    xs[1001] = 1 ;
    xs[1] = 2 ;
    print_int(xs[0]) ;
}

