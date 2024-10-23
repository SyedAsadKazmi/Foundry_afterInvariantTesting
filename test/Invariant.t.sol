// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {StdInvariant} from "lib/forge-std/src/StdInvariant.sol";
import {Handler} from "./Handler.t.sol";
import {Test, console} from "lib/forge-std/src/Test.sol";

contract InvariantsTest is StdInvariant, Test {
    Handler public handler;

    function setUp() public {
        handler = new Handler();
        targetContract(address(handler));
    }

    function invariant_test() public {
        handler.increment();
        console.log("Is Incremented=");
        console.log(handler.isIncrementTested());
        handler.setNumber(66);
    }

    function afterInvariant() public view {
        console.log(handler.isIncrementTested(), handler.isSetNumberTested());
        console.log(handler.numberOfTestRunsForIncrement(), handler.numberOfTestRunsForSetNumber());

        assertEq(handler.isIncrementTested(), true);
        assertEq(handler.isSetNumberTested(), true);
        assertGe(handler.numberOfTestRunsForIncrement() + handler.numberOfTestRunsForSetNumber(), 129);
        console.log("AFTER ALL");
    }
}
