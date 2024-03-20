# OAToken

## OAToken

The `OAToken.sol` contract contains the 2 functions - `depositNFT` and `withdrawNFT` which can be used
to mint OATokens after depositing NFTs and burn OATokens to withdraw NFTs respectively.

Each generation mints a different amount of OATokens for each NFT deposited. 
The total supply of OAToken is capped 5,000,000 OATokens broken down in the following manner

- Elder - 1000 * 1000 = 1,000,000 OATokens
- Resident - 750 * 2000 = 1,500,000 OATokens
- Explorer - 500 * 3000 = 1,500,000 OATokens
- Dreamer - 250 * 4000 = 1,000,000 OATokens

The amount of OATokens minted can be seen below.

| Generation | OATokens Minted |
|------------|-----------------|
| Elder      | 1000 EVMOS      |
| Resident   | 750 EVMOS       |
| Explorer   | 500 EVMOS       |
| Dreamer    | 250 EVMOS       |


## Storage Contracts

To make querying OA generation rarities fully on chain without the need for an external oracle service, 
10000 OAs have been split into separate storage contracts. 

Each storage contract contains the IDs of the OA in the respective generation.

- `OAElders.sol` - Contains the IDs of the OAs in the Elder generation.
- `OAResidents.sol` - Contains the IDs of the OAs in the Resident generation.
- `OAExplorers_1.sol`, `OAExplorers_2.sol` - Contains the IDs of the OAs in the Explorer generation.
- `OADreamers_1.sol`, `OADreamers_2.sol` - Contains the IDs of the OAs in the Dreamer generation.