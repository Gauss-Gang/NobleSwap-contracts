// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//import "hardhat/console.sol";
import "./interfaces/IERC20Metadata.sol";
import "./access/Ownable.sol";
import "./token/SafeERC20.sol";
import "./NobleFarmInitializer.sol";


contract NobleFarmFactory is Ownable {

    event NewFarmContract(address indexed nobleFarm);

    constructor() {
        //
    }

    /*
     * @notice Deploy the pool
     * @param _stakedToken: staked token address
     * @param _rewardToken: reward token address
     * @param _rewardPerBlock: reward per block (in rewardToken)
     * @param _startBlock: start block
     * @param _bonusEndBlock: end block
     * @param _poolLimitPerUser: pool limit per user in stakedToken (if any, else 0)
     * @param _numberBlocksForUserLimit: block numbers available for user limit (after start block)
     * @param _admin: admin address with ownership
     * @return address of new noble farm contract
     */
    function deployPool(
        IERC20Metadata _stakedToken,
        IERC20Metadata _rewardToken,
        uint256 _rewardPerBlock,
        uint256 _startBlock,
        uint256 _bonusEndBlock,
        uint256 _poolLimitPerUser,
        uint256 _numberBlocksForUserLimit,
        address _admin
    ) external onlyOwner {
        require(_stakedToken.totalSupply() >= 0);
        require(_rewardToken.totalSupply() >= 0);
        require(_stakedToken != _rewardToken, "Tokens must be be different");

        bytes memory bytecode = type(NobleFarmInitializer).creationCode;
        // pass constructor argument
        bytecode = abi.encodePacked(bytecode);

        bytes32 salt = keccak256(abi.encodePacked(_stakedToken, _rewardToken, _startBlock));
        address nobleFarmAddress;

        assembly {
            nobleFarmAddress := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }

        NobleFarmInitializer(nobleFarmAddress).initialize(
            _stakedToken,
            _rewardToken,
            _rewardPerBlock,
            _startBlock,
            _bonusEndBlock,
            _poolLimitPerUser,
            _numberBlocksForUserLimit,
            _admin
        );

        emit NewFarmContract(nobleFarmAddress);
    }
}