// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


interface OAStorage {
    function isNFTPresent(uint16 nftId) external view returns (bool);
}

interface OARewardsDistributor {
    function claimRewards(address token) external;
}

interface Wevmos {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

contract OAToken is ERC20, ERC20Burnable, Ownable {
    // @dev The NFT collection contract
    ERC721Enumerable public nftCollection;

    OARewardsDistributor public rewardsDistributor;
    Wevmos public wevmos;

    // @dev Storage contract instances
    OAStorage public elders;
    OAStorage public residents;
    OAStorage public explorers_1;
    OAStorage public explorers_2;
    OAStorage public dreamers_1;
    OAStorage public dreamers_2;

    address private wevmos_address = 0xD4949664cD82660AaE99bEdc034a0deA8A0bd517;
    address private rewards_collector = 0xC043D498A5dfB6cADd668345985902F0bD2bf71C;

    // @dev Rarity score to token amount mapping
    mapping(uint8 => uint256) public apeTypeToTokenAmount;

    event NFTDeposited(address indexed nftContract, uint256 indexed tokenId, address indexed depositor, uint256 tokenAmount);
    event NFTWithdrawn(address indexed nftContract, uint256 indexed tokenId, address indexed withdrawer, uint256 tokenAmount);

    constructor(
        address initialOwner,
        address nftCollectionAddress,
        address rewardsDistributorAddress,
        address eldersAddress,
        address residentsAddress,
        address explorersAddress_1,
        address explorersAddress_2,
        address dreamersAddress_1,
        address dreamersAddress_2
    )
    ERC20("Orbital Apes Token", "OAT")
    Ownable(initialOwner)
    {
        nftCollection = ERC721Enumerable(nftCollectionAddress);
        rewardsDistributor = OARewardsDistributor(rewardsDistributorAddress);
        wevmos = Wevmos(wevmos_address);

        // storage contracts
        elders = OAStorage(eldersAddress);
        residents = OAStorage(residentsAddress);
        explorers_1 = OAStorage(explorersAddress_1);
        explorers_2 = OAStorage(explorersAddress_2);
        dreamers_1 = OAStorage(dreamersAddress_1);
        dreamers_2 = OAStorage(dreamersAddress_2);

        // @dev initialize rarity to token amounts
        apeTypeToTokenAmount[0] = 1000*10**18;
        apeTypeToTokenAmount[1] = 750*10**18;
        apeTypeToTokenAmount[2] = 500*10**18;
        apeTypeToTokenAmount[3] = 250*10**18;
    }

    // @dev Deposit an NFT and mint corresponding ERC20 tokens
    function depositNFT(uint16 nftId) public {
        // Verify the depositor owns the NFT and the NFT is approved for transfer
        require(nftCollection.ownerOf(nftId) == msg.sender, "Not the NFT owner");
        require(nftCollection.getApproved(nftId) == address(this) || nftCollection.isApprovedForAll(msg.sender, address(this)), "NFT not approved for transfer");

        uint8 nftType = getNFTType(nftId);

        // Transfer the NFT from the user to this contract
        nftCollection.transferFrom(msg.sender, address(this), nftId);

        // Calculate the amount of ERC20 tokens to mint based on the NFT's rarity
        uint256 tokenAmount = apeTypeToTokenAmount[nftType];

        // Mint ERC20 tokens to the depositor
        _mint(msg.sender, tokenAmount);

        // Emit event
        emit NFTDeposited(address(nftCollection), nftId, msg.sender, tokenAmount);
    }

    // @dev Withdraw an NFT by burning the corresponding ERC20 tokens
    function withdrawNFT(uint16 nftId) public {
        require(nftCollection.ownerOf(nftId) == address(this), "NFT not owned by the contract");

        uint256 userBalance = balanceOf(msg.sender);
        uint8 rarity = getNFTType(nftId);
        uint256 tokenAmount = apeTypeToTokenAmount[rarity];
        require(userBalance >= tokenAmount, "Insufficient balance to withdraw NFT");

        // Burn the ERC20 tokens from the user
        _burn(msg.sender, tokenAmount);

        withdrawRewardsForContract(wevmos_address);
        withdrawRewardsFromContract(rewards_collector);

        // Transfer the NFT from this contract to the user
        nftCollection.transferFrom(address(this), msg.sender, nftId);

        // Emit event
        emit NFTWithdrawn(address(nftCollection), nftId, msg.sender, tokenAmount);
    }

    // @dev Get the type of NFT
    function getNFTType(uint16 nftId) public view returns (uint8) {
        if (elders.isNFTPresent(nftId)) return 0;
        if (residents.isNFTPresent(nftId)) return 1;
        if (explorers_1.isNFTPresent(nftId) || explorers_2.isNFTPresent(nftId)) return 2;
        if (dreamers_1.isNFTPresent(nftId) || dreamers_2.isNFTPresent(nftId)) return 3;
        revert("NFT not found in any storage");
    }

    function getAllNFTInContract(uint8 apeType) public view returns (uint16[] memory) {
        uint256 totalNFTs = nftCollection.balanceOf(address(this));
        uint16[] memory tempNftIds = new uint16[](totalNFTs);
        uint256 count = 0;

        for (uint256 i = 0; i < totalNFTs; i++) {
            uint256 nftId = nftCollection.tokenOfOwnerByIndex(address(this), i);
            uint8 rarity = getNFTType(uint16(nftId));
            if(rarity == apeType) {
                tempNftIds[count] = uint16(nftId);
                count++;
            }
        }

        uint16[] memory nftIds = new uint16[](count);
        for (uint256 i = 0; i < count; i++) {
            nftIds[i] = tempNftIds[i];
        }

        return nftIds;
    }

    function withdrawRewardsForContract(address token) public onlyOwner {
        rewardsDistributor.claimRewards(token);
    }

    function withdrawRewardsFromContract(address payee) public onlyOwner {
        uint256 balance = wevmos.balanceOf(address(this));
        if (balance > 0) {
            wevmos.transfer(payee, balance);
        }
    }
}
