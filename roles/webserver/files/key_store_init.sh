#!/bin/bash

# Run an expect command to automate prompts in initcert.js
expect -c "
    # Start the initcert.js script in a new shell
    spawn bash -c \"./initcert.js\"

    # Respond to the initial passphrase prompt
    expect -exact \"Enter passphrase of certificate for sample: \"
    send \"password\n\"

    # Respond to the password prompt
    expect -exact \"Password: \"
    send \"password\n\"

    # Allows interaction afterward, if needed
    interact
"