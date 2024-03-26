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

## Deployed contracts list
`OADreamers_1.sol` 0x5c1d7931eF06D8dae97940141D9c8D21D27e22CA
`OADreamers_2.sol` 0xAEE997C7853F4122D00C62357e994b9915f8A465
`OAExplorers_1.sol` 0x7ffE7A7f74DBf3b5456AC7095bc1FF5A28A00002
`OAExplorers_2.sol` 0x5C9BC7604023db06C9904e8c188559779494Eb7f
`OAResidents.sol` 0xA6DE8Bf2439a7bF41C46c318Cf88665Cb3618ECf
`OAElders.sol` 0x6d42a91aDc5dCd07AA74846aF3D7f1f33BF67023
`OAToken.sol` 0xeaa87fdf35a041963a1902dcc26bbaa2386a6800
