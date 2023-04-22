// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Array {
    int [] public numbers=[-1,2,3]; //[] dynamic size array , [3] fixed size array
    function add() public {
        numbers.push(4);//adding number to numers array in the last index position
    }
    function pop() public{
        numbers.pop();//removes the top element in the array
    }
    function array() public view returns(int[] memory){
        return numbers;
    }

    function del() public{
        delete numbers[2];//deletes the specified index position value but it contain the memory space
    }
    function removeValue()public{
        numbers[3] = numbers[numbers.length-1]; //which completly removes the mrmory space and the value form the index positon 
    }
}
