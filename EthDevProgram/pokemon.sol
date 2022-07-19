// SPDX-License-Identifier: GPL-3.0
//sígueme en twitter para más de Web3 = https://twitter.com/abrahamrivv 
pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

    //RETO #1 = Los Events, o eventos en Español, permiten el uso de las funciones de logging que proporciona de manera nativa la Ethereum Virtual Machine (EVM) y que a su vez se pueden utilizar para retornar datos a nuestras dapps haciendo uso de JavaScript como handler de dichos eventos.
    //RETO #2 = https://www.ajaypalcheema.com/require-in-solidity/
    event eventNewPokemon(string, uint);

  struct Pokemon {
    uint id;
    string name;
  }

    Pokemon[] private pokemons;

    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;

     function createPokemon (string memory _name, uint _id) public {
        pokemons.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name, _id);
        require(_id > 0, "El id debe ser mayor a 0");
        require(bytes(_name).length > 2 , "El name debe ser mayor a 2 caracteres");
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
      return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
   }
   
}

//sígueme en twitter para más de Web3 = https://twitter.com/abrahamrivv 
