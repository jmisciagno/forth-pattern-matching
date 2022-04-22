0 construct z
1 construct s

: test1
    match
    (| z 0 |)
    (| s recurse 1+ |)
    end
;

z s s s test1 . cr

0 construct #t
0 construct #f
1 construct notb
2 construct orb
2 construct andb

: test2
    match
    (| #t true |)
    (| #f false |)
    (| notb recurse invert |)
    (| orb >r recurse r> recurse or |)
    (| andb >r recurse r> recurse and |)
    end
;

#t test2 . cr
#f test2 . cr
#f notb test2 . cr
#t #f andb test2 . cr
#t #f orb test2 . cr
