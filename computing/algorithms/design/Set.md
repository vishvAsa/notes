+++
title = "Set"

+++
Basic operations include listing elements, checking set-membership, finding unions and intersections.

Set implementations include the ListSet and the BitSet.

## Bit-set
BitSet uses a sequence of bits - one for each element. Theoretically, it can store arbitrary elements which may be mapped to integers, but is often used to store integers. Its size is equal to the largest number N stored in the set, though it may store k elements; so, from this perspective, using it in preference to ListSet makes sense when the set is dense. Unlike listSets, membership check is constant time. But, listing the elements of the set requires O(N) time, often greater than O(k) required by ListSets.
