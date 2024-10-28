#!/bin/bash
set -x
# Run an expect command to automate prompts in initcert.js
expect -c "
  # Start the initcert.js script in a new shell
  spawn bash -c \"./initcert.js\"

  # Respond to the initial passphrase prompt with a timeout
  expect -timeout 10 -exact \"Enter passphrase of certificate for sample: \"
  send \"password\n\"

  # Respond to the password prompt with a timeout
  expect -timeout 10 -exact \"Password: \"
  send \"password\n\"

  # Wait for the script to finish or a timeout
  expect -timeout 30 eof
"