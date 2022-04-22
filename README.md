# forth-pattern-matching
Pattern Matching for Forth

Example:

    0 construct #t
    0 construct #f
    1 construct notb
    2 construct orb
    2 construct andb

    : eval
        match
        (| #t true |)
        (| #f false |)
        (| notb recurse invert |)
        (| orb >r recurse r> recurse or |)
        (| andb >r recurse r> recurse and |)
        end
    ;

    #t eval . cr             \ -1
    #f test2 . cr.           \ 0
    #f notb test2 . cr.      \ -1
    #t #f andb test2 . cr.   \ 0
    #t #f orb test2 . cr.    \ -1
