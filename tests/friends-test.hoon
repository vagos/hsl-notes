/+  *test
/=  friends  /gen/friends
|%
++  test-01
 %+  expect-eq
 !>  (my ~[['vagos' 5] ['johnson' 5]])
 !>  (friends [~['vagos' 'johnson'] 10])
++  test-02
 %+  expect-eq
 !>  (my ~[['vagos' 6] ['johnson' 6] ['jack' 5]])
 !>  (friends [~['vagos' 'johnson' 'jack'] 17])
++  test-03
 %+  expect-eq
 !>  (my ~[['vagos' 0] ['johnson' 0] ['jack' 0]])
 !>  (friends [~['vagos' 'johnson' 'jack'] 0])
++  test-04
 %-  expect-fail
  |.  (friends [~ 0])
--
