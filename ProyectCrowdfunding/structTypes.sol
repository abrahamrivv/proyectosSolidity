// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct Hero {
    string name;
    uint age;
    string power;
    string team;
}

Hero butcher = Hero("butcher", 40, "laser vision", "los pibes");

butcher.name //Butcher
butcher.age //40
butcher.power //laser vision
butcher.team //los pibes