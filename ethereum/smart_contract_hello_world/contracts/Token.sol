pragma solidity ^0.8.0;

contract TuTuToken { 
  string public tokenName = "TU-TU-TOKEN";
  string public tokenSymbol = "TTT";

  uint256 public tokenSupply = 100;

  address public owner;

  mapping(address => uint256) balances;

  event Transfer(address indexed _from, address indexed _to, uint256 value);

  constructor() {
    balances[msg.sender] = tokenSupply;
    owner = msg.sender;
  }

  function transfer(address to, uint256 amount) external { 
    require(balances[msg.sender] >= amount, "Not enough TU-TU tokens");

    balances[msg.sender] -= amount; 
    balances[to] += amount;

    emit Transfer(msg.sender, to, amount);
  }

  function balanceOf(address account) external view returns (uint256) { 
    return balances[account];
  }
}
