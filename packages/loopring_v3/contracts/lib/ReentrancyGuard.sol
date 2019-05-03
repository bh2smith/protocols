/*

  Copyright 2017 Loopring Project Ltd (Loopring Foundation).

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
pragma solidity 0.5.7;


/// @title Ownable
/// @author Brecht Devos - <brecht@loopring.org>
/// @dev Exposes a modifier that guards a function against reentrancy
contract ReentrancyGuard
{
    // Start at 1 so we don't have an expensive 0 -> 1 SSTORE
    uint256 private _guardCounter = 1;

    // Use this modifier on a function to prevent reentrancy
    modifier nonReentrant()
    {
        _guardCounter += 1;
        uint256 _counter = _guardCounter;
        // Function body
        _;
        // Check if the counter remained the same
        require(_counter == _guardCounter, "REENTRANCY");
    }
}
