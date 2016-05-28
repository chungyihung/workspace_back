#!/bin/bash

udisks --unmount /dev/sdb1
udisks --unmount /dev/sdb2
udisks --detach /dev/sdb
