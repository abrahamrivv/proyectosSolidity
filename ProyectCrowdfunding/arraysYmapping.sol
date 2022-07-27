// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Fijos: 
uint[3] steps = [1,2,3];

//Dinamicos: 
uint[] steps;

steps.push(1) // [1]
steps.push(2) // [1,2]
steps.pop() // [1]

steps[0]  //1

// mapping
mapping (string -> string) countries;

countries['Felipe'] = 'Colombia';
countries['Laura']= 'Ecuador';

countries['Felipe'] // 'Colombia';
countries['Laura'] // 'Ecuador';