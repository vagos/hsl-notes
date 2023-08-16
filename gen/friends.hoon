:: friends-share.hoon
::
:: Calculate the ammount of pieces that should be assigned to each friend.
:: Pieces are first split amongst the friends equally. Then, any leftover pieces are given some "lucky" friends.
!:
|=  [friends=(list @t) pieces=@ud]
=<
~&  friends
(combine (share friends pieces) (leftovers friends pieces))
|%
:: Assign to each friend an ammount of pieces given by diving the total ammount by the number of friends.
::
++  share
  |=  [friends=(list @t) pieces=@ud]
  =/  pieces  (split-pieces friends pieces)
  =/  pieces  p.pieces
  ^-  (map @t @ud)
  =|  sharing=(map @t @ud)
  |-
  ?~  friends
  sharing
  $(sharing (~(put by sharing) i.friends pieces), friends t.friends)
::  Assign one piece to each of the friends until we run out.
::
++  leftovers
  |=  [friends=(list @t) pieces=@ud]
  =/  pieces  (split-pieces friends pieces)
  =/  pieces  l.pieces
  ^-  (map @t @ud)
  =|  leftovers=(map @t @ud)
  |-
  ?~  friends
  leftovers
  ?:  =(pieces 0)
  $(leftovers (~(put by leftovers) i.friends 0), friends t.friends)
  $(pieces (dec pieces), leftovers (~(put by leftovers) i.friends 1), friends t.friends)
::  Compute the div and mod of the available food pieces to the number of friends.
::
++  split-pieces
  |=  [friends=(list @t) pieces=@ud]
  ^-  [p=@ud l=@ud]
  :-  p=(div pieces (lent friends))
  l=(mod pieces (lent friends))
::  Add the values of two maps with identical keys.
::
++  combine
  |=  [m1=(map @t @ud) m2=(map @t @ud)]
  (~(urn by m1) |=([k=@ v=@] (add v (~(got by m2) k))))
--
