import unittest, unsigned

import random.mersenne, random.xorshift


suite "Mersenne Twister":
  test "implementation":
    var rng = initMersenneTwister([0x123u32, 0x234, 0x345, 0x456])
    check([rng.randomUint32(), rng.randomUint32(), rng.randomUint32()] == [
      1067595299u32, 955945823, 477289528
    ])

suite "Xorshift128+":
  test "implementation":
    var rng = initXorshift128Plus([1234524356u64, 47845723665u64])
    check([rng.randomUint64(), rng.randomUint64(), rng.randomUint64()] == [
      10356027574996968u64, 421627830503766283u64, 7267806761253193977u64
    ])
    
    rng = initXorshift128Plus([262151541652562u64, 468594272265u64])
    check([rng.randomUint64(), rng.randomUint64(), rng.randomUint64()] == [
      3923822141990852456u64, 3993942717521754294u64, 13070632098572223408u64
    ])

suite "Xorshift1024*":
  test "implementation":
    var rng = initXorshift1024Star([4873361256124563431u64, 468594272265151u64,
      24562895618746132u64, 13135123616214u64, 446469974321u64,
      798436146749841u64, 64321987496463241u64, 0u64, 87942132u64,
      9879876514321846456u64, 654698741u64, 87984321u64, 546984321u64,
      4521584632u64, 6546459846165u64, 849416516516115u64
    ])
    check([rng.randomUint64(), rng.randomUint64(), rng.randomUint64()] == [
      17423166013011235612u64, 2597568971996913771u64, 780893741250465115u64
    ])
