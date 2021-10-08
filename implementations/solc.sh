rm -R ./solc/**/*
solc --asm @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/evm/
solc --storage-layout @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/storage-layout/ --pretty-json
solc --opcodes @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/opcodes/
solc --hashes @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/selectors/
solc --gas @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol >> ./solc/gas-costs.md
solc --bin @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/bytecode/
solc --metadata @openzeppelin/="$(pwd)"/node_modules/@openzeppelin/ solidity-bytes-utils/="$(pwd)"/node_modules/solidity-bytes-utils/ ../Utils="$(pwd)/contracts/Utils" contracts/ERC725/ERC725Account.sol -o ./solc/metadata/