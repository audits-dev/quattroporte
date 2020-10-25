pragma solidity >=0.4.21 <0.7.0;

/**
  * @title Quattroporte
  * @dev Quattroporte is a uint256 number that
  * allows 4 uint64 values to be stored within,
  * at specific indexes:
  * | index0 | index1 | index2 | index3 |
  * | 64bits | 64bits | 64bits | 64bits |
  */
library Quattroporte {

  function setIndex0(uint256 _self, uint64 _num) internal pure returns (uint256) {
    return ((_self << 64) >> 64) | (uint256(_num) << 192);
  }

  function getIndex0(uint256 _self) internal pure returns (uint64) {
    return uint64(_self >> 192);
  }

  function setIndex1(uint256 _self, uint64 _num) internal pure returns (uint256) {
    return ((_self << 128) >> 128) | (uint256(getIndex0(_self)) << 192) | (uint256(_num) << 128);
  }

  function getIndex1(uint256 _self) internal pure returns (uint64) {
    return uint64(_self >> 128);
  }

  function setIndex2(uint256 _self, uint64 _num) internal pure returns (uint256) {
    return ((_self >> 128) << 128) | (uint256(_num) << 64) | uint256(getIndex3(_self));
  }

  function getIndex2(uint256 _self) internal pure returns (uint64) {
    return uint64(_self >> 64);
  }

  function setIndex3(uint256 _self, uint64 _num) internal pure returns (uint256) {
    return ((_self >> 64) << 64 | _num);
  }

  function getIndex3(uint256 _self) internal pure returns (uint64) {
    return uint64(_self);
  }

  function getAll(uint256 _self) internal pure returns (uint64, uint64, uint64, uint64) {
    return (getIndex0(_self), getIndex1(_self), getIndex2(_self), getIndex3(_self));
  }
}
