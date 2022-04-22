: thd 2 pick ;
: 3dup thd thd thd ;
: s: ( a u ) header, (:noname) ;
: concat 2>r pad place 2r> pad +place pad count ;
: make-construct >r s: r> lastxt ]] here >r literal , literal 0 ?do , loop r> ; [[ ;
: make-destruct >r s" _match" concat s: r> ]] literal 0 ?do dup i 1+ cells + @ swap loop drop ; [[ ;
: construct >r parse-name r> 3dup make-construct make-destruct ;
: xt find-name dup 0= if drop -13 throw then name?int ;
: match postpone >r 0 ; immediate
: fail s" Failed to match." exception throw ;
: end postpone fail 0 ?do postpone then loop postpone rdrop ; immediate
: (| 1+ >r parse-name 2dup 2>r xt ]] r@ dup @ literal = if [[ 2r> s" _match" concat xt compile, r> ; immediate
: |) >r postpone else postpone drop r> ; immediate
