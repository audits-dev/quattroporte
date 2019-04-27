pragma solidity >=0.4.21 <0.6.0;

import "../contracts/Quattroporte.sol";

/**
 * Truffle's Assert library doesn't include tests for
 * uint64, which are the values we want to test. Instead,
 * we can simply use Solidity's built-in assert statements
 * to perform nearly the same functionality, minus messages.
 */
contract TestQuattroporte {
  using Quattroporte for uint256;

  uint256 internal num;

  function testInitialState() public {
    assert(num == 0);
  }

  function testIndex0() public {
    num = num.setIndex0(1);
    assert(num.getIndex0() == 1);
  }

  function testIndex1() public {
    num = num.setIndex1(2);
    assert(num.getIndex1() == 2);
  }

  function testIndex2() public {
    num = num.setIndex2(3);
    assert(num.getIndex2() == 3);
  }

  function testIndex3() public {
    num = num.setIndex3(4);
    assert(num.getIndex3() == 4);
  }

  function testCombined() public {
    (uint64 index0, uint64 index1, uint64 index2, uint64 index3) = num.getAll();
    assert(index0 == 1);
    assert(index1 == 2);
    assert(index2 == 3);
    assert(index3 == 4);
  }

  function testUpdateIndex3() public {
    num = num.setIndex3(5);
    assert(num.getIndex3() == 5);
  }

  function testUpdateIndex1() public {
    num = num.setIndex1(6);
    assert(num.getIndex1() == 6);
  }

  function testUpdateIndex2() public {
    num = num.setIndex2(7);
    assert(num.getIndex2() == 7);
  }

  function testUpdateIndex0() public {
    num = num.setIndex0(8);
    assert(num.getIndex0() == 8);
  }

  function testUpdatedCombined() public {
    (uint64 index0, uint64 index1, uint64 index2, uint64 index3) = num.getAll();
    assert(index0 == 8);
    assert(index1 == 6);
    assert(index2 == 7);
    assert(index3 == 5);
  }
}