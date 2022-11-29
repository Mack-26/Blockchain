//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Details{
    address public rootCA;
    mapping(address => uint) public student;
    struct studDetails{
        address Student;
        string Name;
        string branch;
        uint UID;
    }
    uint public studCount=0;
    studDetails[] public stu;
    mapping (uint => studDetails) public studDeets;
    constructor() {
        rootCA=msg.sender;
    }
    modifier onlyOwner(){
        require(rootCA==msg.sender, "Only Root Certificate Authority can access this function");
        _;
    }
    function setStudent (address user, string memory _name, string memory _branch , uint _UID) public onlyOwner {
        studDeets[studCount].Student = user;
        studDeets[studCount].Name = _name;
        studDeets[studCount].branch = _branch;
        studDeets[studCount].UID = _UID;
    }
    
    function getStudent(uint ID) public view returns(studDetails memory){
        return (studDeets[ID]);
    }
}
