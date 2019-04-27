# Quattroporte - A Solidity library for uint256 to (uint64,uint64,uint64,uint64)

## Install

```
npm i @audits/quattroporte --save
```

## Usage

Import into your contract:

```
import "@audits/quattroporte/contracts/Quattroporte.sol";
```

And add to the `uint256` type:

```
using Quattroporte for uint256;
```

With any `uint256`, you can use 4 distinct `uint64` types via getters and setters via index0-3:

```
function setMyNumber0(uint64 _value) public {
  myNumber = myNumber.setIndex0(_value);
}

function getMyNumber0() public view returns (uint64) {
  return myNumber.getIndex0();
}
```

You can also receive all the numbers in a tuple:

```
function getMyNumbers() public {
  (uint64 index0, uint64 index1, uint64 index2, uint64 index3) = myNumber.getAll();
  // Do something with the values...
}
```