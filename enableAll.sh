#!/bin/bash

for config in *; do [ -d "${config}" ] && stow $config; done
