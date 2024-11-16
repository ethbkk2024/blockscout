#!/bin/bash

# Step 1: Make the POST request to get the block number
response=$(curl -s -H "Content-Type: application/json" -X POST \
  --data '{"id":0,"jsonrpc":"2.0","method":"eth_blockNumber","params":[]}' \
  https://blockscout.acmedigital.io/api/eth-rpc)

# Step 2: Extract the hex block number from the response
hex_block=$(echo "$response" | jq -r '.result')

# Remove the "0x" prefix if present
hex_block_no_prefix=$(echo "$hex_block" | sed 's/^0x//')

# Convert the hex value to decimal using printf
decimal_block=$(printf "%d\n" "0x$hex_block_no_prefix")

# Output the results
echo "Hex Block Number: $hex_block"
echo "Decimal Block Number: $decimal_block"
