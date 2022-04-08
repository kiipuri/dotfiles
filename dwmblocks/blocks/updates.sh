#!/bin/sh

updates="  $(checkupdates | wc -l)"
echo $updates
