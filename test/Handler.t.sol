pragma solidity ^0.8.24;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {Counter} from "./../../src/Counter.sol";

contract Handler is Test {
    Counter public counter;

    bool public isIncrementTested;
    bool public isSetNumberTested;
    uint256 public numberOfTestRunsForIncrement;
    uint256 public numberOfTestRunsForSetNumber;

    constructor() {
        counter = new Counter();
    }

    function increment() public {
        uint256 numberBeforeIncrement = counter.number();
        if (numberBeforeIncrement < type(uint256).max) {
            counter.increment();
            assertEq(counter.number(), numberBeforeIncrement + 1);
        }
        isIncrementTested = true;
        numberOfTestRunsForIncrement++;
    }

    function setNumber(uint256 x) public {
        // 1332314121733367080437221031067681893270040343775637925054949
        // 115792089237316195423570985008687907853269984665640564039457584007913129639935

        counter.setNumber(x);
        console.log(counter.number(), x);
        assertEq(counter.number(), x);
        isSetNumberTested = true;
        numberOfTestRunsForSetNumber++;
    }
}
