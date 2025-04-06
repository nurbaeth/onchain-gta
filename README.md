# 🚗 Onchain GTA — Solidity Game

> Fully on-chain GTA-inspired game written in Solidity.  
> Steal cars, explore the map, and live your best criminal life — all on the blockchain.

![gta-style](https://media.giphy.com/media/xT0xeJpnrWC4XWblEk/giphy.gif)

---

## 🎮 Game Overview

**Onchain GTA** is a decentralized game built entirely with smart contracts. Inspired by the classic Grand Theft Auto series, this version is a minimalistic, grid-based adventure that lives 100% on-chain.

- 🗺️ Grid-based map (10x10)
- 🚘 Cars scattered around the city
- 🕹️ Players can move & steal cars
- 📡 No frontend needed — play directly via smart contract calls

---

## ✨ Features

| Feature         | Description                          |
|----------------|--------------------------------------|
| 🔹 Join Game     | Spawn your player at any coordinate  |
| 🔹 Move          | Navigate the city grid               |
| 🔹 Steal Car     | Find and take control of a vehicle   |
| 🔹 100% On-chain | All logic and storage is on Ethereum |

---

## 🔧 Smart Contract Functions

```solidity
joinGame(uint8 x, uint8 y)
