#!/bin/bash

# This is a simple DB management script
# Means less typing, more ermahgerd

username="un"
password="pw"
rootpass="pw01"

function runscript {
  script=$1
  echo "Running Script: $script"
  output=$( { mysql -u root -p$rootpass < "$script"; } 2>&1)
  colorize output
}

function create {
  stmt="CREATE DATABASE dsr; CREATE USER '$username'@'localhost' IDENTIFIED BY '$password'; GRANT ALL PRIVILEGES ON dsr.* TO dsr@localhost IDENTIFIED BY '$username' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  echo "About to run: $stmt"

  output=$( { mysql -u root -p$rootpass -e "$stmt"; } 2>&1)
  colorize output

  runscript "migrations/000-scriptrun.sql"
  runscript "migrations/001-tables.sql"
}

function drop {
  stmt="DROP DATABASE dsr; DROP USER '$username'@'localhost'"
  echo "About to run: $stmt"
  output=$( { mysql -u root -p$rootpass -e "$stmt"; } 2>&1)
  colorize output
}

function populate {
  runscript "migrations/002-basedata.sql"
}

function rebuild {
  drop
  create
  populate
}

function connect {
  mysql -u root -p$rootpass
}

function colorize {

  if [[ "$output" =~ "ERROR" ]]; then
    printf "\n\e[1;31m$output\e[0m\n"
  else
    printf "\n\e[1;32m$output\e[0m\n"
  fi
}

die () {
    echo >&2 "$@"
    exit 1
}

# Check command line argument
if [ "$#" -eq 0 ]; then
  connect
else
  cmd=$1
  if [ "$cmd" == "create" ]; then
    create
  elif [ "$cmd" == "drop" ]; then
    drop
  elif [ "$cmd" == "rebuild" ]; then
    rebuild
  elif [ "$cmd" == "populate" ]; then
    populate
  else
    echo "Command $cmd unknown"
  fi
fi
