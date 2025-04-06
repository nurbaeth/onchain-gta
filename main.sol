// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract OnchainGTA {
    uint8 constant MAP_WIDTH = 10;
    uint8 constant MAP_HEIGHT = 10;

    struct Player {
        uint8 x;
        uint8 y;
        bool hasCar;
    }

    struct Car {
        uint8 x;
        uint8 y;
        bool taken;
    }

    mapping(address => Player) public players;
    Car[] public cars;

    constructor() {
        // spawn some initial cars on the map
        cars.push(Car(2, 3, false));
        cars.push(Car(5, 5, false));
        cars.push(Car(8, 1, false));
    }

    modifier onlyOnMap(uint8 x, uint8 y) {
        require(x < MAP_WIDTH && y < MAP_HEIGHT, "Out of bounds");
        _;
    }

    function joinGame(uint8 x, uint8 y) external onlyOnMap(x, y) {
        Player storage p = players[msg.sender];
        require(p.x == 0 && p.y == 0 && !p.hasCar, "Already joined");
        players[msg.sender] = Player(x, y, false);
    }

    function move(string calldata direction) external {
        Player storage p = players[msg.sender];
        require(p.x < MAP_WIDTH && p.y < MAP_HEIGHT, "Not in game");

        if (keccak256(bytes(direction)) == keccak256("up") && p.y > 0) {
            p.y -= 1;
        } else if (keccak256(bytes(direction)) == keccak256("down") && p.y < MAP_HEIGHT - 1) {
            p.y += 1;
        } else if (keccak256(bytes(direction)) == keccak256("left") && p.x > 0) {
            p.x -= 1;
        } else if (keccak256(bytes(direction)) == keccak256("right") && p.x < MAP_WIDTH - 1) {
            p.x += 1;
        } else {
            revert("Invalid move");
        }
    }

    function stealCar() external {
        Player storage p = players[msg.sender];
        require(!p.hasCar, "Already has a car");

        for (uint i = 0; i < cars.length; i++) {
            if (!cars[i].taken && cars[i].x == p.x && cars[i].y == p.y) {
                cars[i].taken = true;
                p.hasCar = true;
                return;
            }
        }

        revert("No car to steal here");
    }

    function getPlayer(address player) external view returns (uint8 x, uint8 y, bool hasCar) {
        Player storage p = players[player];
        return (p.x, p.y, p.hasCar);
    }

    function getCars() external view returns (Car[] memory) {
        return cars;
    }
}
