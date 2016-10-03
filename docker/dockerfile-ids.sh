#!/bin/bash

sed -i "s/ENV\ PERM_USER_ID\ 1000/ENV\ PERM_USER_ID\ $(id -u)/g" $SEMAPHORE_PROJECT_DIR/docker/Dockerfile
sed -i "s/ENV\ PERM_GROUP_ID\ 1000/ENV\ PERM_GROUP_ID\ $(id -g)/g" $SEMAPHORE_PROJECT_DIR/docker/Dockerfile
