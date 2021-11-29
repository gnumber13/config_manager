#!/usr/bin/env bats
. ./units.sh
. ./config.sh


@test "check_valid_input multiple chars and jibberiish" {
    check_valid_input "123"
    check_valid_input 123
    check_valid_input "iji" || failure=1
    [ $failure -eq 1 ]
}


@test "check_valid_input singl chars" {
    check_valid_input 2
    check_valid_input "2"
    check_valid_input "a" || failure=1
    [ $failure -eq 1 ]
}
