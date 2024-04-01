#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# Bold text
BOLD='\033[1m'

# Functions to print messages
function print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

function print_error() {
    echo -e "${RED}✘ $1${NC}"
}

function print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

function print_info() {
    echo -e "${BLUE}$1${NC}"
}
