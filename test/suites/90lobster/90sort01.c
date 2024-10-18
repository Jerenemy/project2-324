/*!tests!
 *
 * {
 *      "input":    ["5", "1", "6", "3", "8", "4"],
 *      "output":   ["Original list:", "1", "6", "3", "8", "4", "Sorted list:", "1", "3", "4", "6", "8"]
 * }
 *
 */
#include "cminus.h"

/* COMP 211 Homework 6: searching and sorting.
 *
 * J. Zay
 */

/* ************************ sum_search ************************ */

/* sum_search(xs, n, k) = true,  if there are i ≠ j such that xs[i]+xs[j]=k
 *                        false, otherwise.
 * 
 * Pre-conditions:
 * - xs has size n.
 * - xs[0] ≤ xs[1] ≤ ... ≤ xs[n-1].
 */
bool sum_search(int xs[], int n, int k) {
    int i = 0 ;
    int j = n - 1 ;
    
    while (i < j) {        
        if (xs[i]+xs[j] == k) {
            return true ;
        }
        else if (xs[i]+xs[j] < k) {
            i = i + 1 ;  /* UPDATE */
        }
        else {
            j = j - 1 ;  /* UPDATE */
        }
    }
    return false ;
}

/* ************************ ins_sort ************************ */

/* swap(xs, i, j):  
 *
 * Pre-condition:   0 <= i, j < length xs.
 * 
 * Post-condition:  swaps xs[i] and xs[j].
 */
void swap(int xs[], int i, int j){
    int t = xs[i] ;
    xs[i] = xs[j] ;
    xs[j] = t ;
}

/* insert(xs, i):   
 *
 * Pre-condition:   0 <= i < length xs.
 *                  xs[0:i-1] is sorted in non-decreasing order.
 * Post-condition:  inserts xs[i] into correct slot in xs[0:i] such that xs[0:i] is sorted
 * in non-decreasing order.
 */
void insert(int xs[], int i) {
    int j = i;  /* UPDATE */
    while (j > 0) {  /* UPDATE */
        if (xs[j] < xs[j-1]) {
            swap(xs, j, j-1) ;
        }
        else {
            break ;
        }
        j = j - 1;  /* UPDATE */
    }
}

/* ins_sort(xs, n):
 *
 * Pre-condition:  xs has length n.
 * Post-condition:  xs is sorted in non-decreasing order.
 */
void ins_sort(int xs[], int n) {
    int i = 0;  /* UPDATE */
    while (i < n) {  /* UPDATE */
        insert(xs, i) ;
        i = i + 1;  /* UPDATE */
    }
}

/* ************************ merge_sort ************************ */

/* merge(xs, n, sn):
 *
 * Pre-conditions:  xs has length n, n = 2^k for some k.
 *                  xs is made up of subarrays sorted in non-decreasing order, each with length 0 < sn < n, sn = 2^h for some h.
 *                  0 <= start_i < n, start_i / sn = 0 (/ is integer division).
 * 
 * Post-condition:  the two consecutive subarrays of length sn, starting at index start_i in xs, are merged into one subarray in non-decreasing order.
 */
void merge(int xs[], int start_i, int sn) {
    int i = start_i ; /*index: start of left half of subarray in xs */
    int j = start_i + sn ;  /*index: start of right half of subarray*/
    int k = 0 ;     /*temp array index*/
    int end_tsl = sn + start_i ;    /*specifies length of left half of temp array ts, as an index relating to i*/
    int end_tsr = sn*2 + start_i ;  /*specifies length of right half of temp array ts, as an index relating to j*/
    int ts[sn*2] ;  /*temp array ts[] with length double each subarray*/

    while (i < end_tsl && j < end_tsr) {
        if (xs[i] <= xs[j]) {
            ts[k] = xs[i] ;
            i = i + 1 ;  /* UPDATE */
        }
        else {
            ts[k] = xs[j] ;
            j = j + 1 ;  /* UPDATE */
        } 
        k = k + 1 ;  /* UPDATE */
    }
    
    /*handle indices outside of corresponding subarrays*/
    while (i < end_tsl) {
        ts[k] = xs[i];
        i = i + 1 ;  /* UPDATE */
        k = k + 1 ;  /* UPDATE */
    }
    
    while (j < end_tsr) {
        ts[k] = xs[j] ;
        j = j + 1 ;  /* UPDATE */
        k = k + 1 ;  /* UPDATE */
    }

    /*copy temp array ts into xs*/
    int l = 0;  /* UPDATE */
    while (l < sn*2) {  /* UPDATE */
        xs[l+start_i] = ts[l] ;
        l = l + 1 ;  /* UPDATE */
    }
}

/* n_is_two_to_the(n) = int,   returns value r, r^2 = n
 * 
 * Pre-condition: n >= 1
 */
int n_is_two_to_the(int n) {
    int r = 1 ;
    while (r <= n/2) {
        r = r * 2 ;
    }
    return r;
}

/* two_to_the(n) = int,   returns value r, 2^n = r
 * 
 * Pre-condition: n >= 0
 */
int two_to_the(int n) {
    int r = 1 ;
    int i = 0;  /* UPDATE */
    while (i < n) {  /* UPDATE */
        r = r * 2;
        i = i + 1;  /* UPDATE */
    }
    return r ;
}

/* merge_consecutive(xs, n, sn):
 *
 * Pre-conditions:  xs has length n, n = 2^k for some k.
 *                  xs is made up of subarrays sorted in non-decreasing order, each with length 0 < sn < n, sn = 2^h for some h.
 * 
 * Post-condition:  each pair of consecutive sorted subarrays of length sn in xs are merged, the merged subarray sorted in non-decreasing order.
 */
void merge_consecutive(int xs[], int n, int sn) {
    int merges = n / two_to_the(sn + 1) ;
    int i = 0;  /* UPDATE */
    while (i < merges) {  /* UPDATE */
        merge(xs, i * two_to_the(sn + 1), two_to_the(sn)) ;
        i = i + 1;  /* UPDATE */
    }

    return ;
}

/* merge_sort(xs, n):
 *
 * Pre-condition:  xs has length n, n = 2^k for some k.
 * Post-condition:  xs is sorted in non-decreasing order.
 */
void merge_sort(int xs[], int n) {
    int twos_in_n = n_is_two_to_the(n) ;
    int i = 0;  /* UPDATE */
    while (i < twos_in_n) {  /* UPDATE */
        merge_consecutive(xs, n, i) ;
        i = i + 1;  /* UPDATE */
    }

    return ;
}


void main() {
    int n = 5;
    /* 
    int xs[5] = {2, 3, 1, 9, 3} ;
    merge_sort(xs, n) ;
    */

    return ;
}