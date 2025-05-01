#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }
error() { echo -e "${RED}ERROR: $*${NC}" >&2; }

detect_os() {
    OS="$(uname -s)"
    case "$OS" in
        Linux*)  echo "linux" ;;
        Darwin*) echo "macos" ;;
        *)       echo "unknown" ;;
    esac
}

main() {
    log "Starting install script"
    OS_TYPE=$(detect_os)
    if [[ "$OS_TYPE" == "unknown" ]]; then
        error "Unsupported OS: $(uname -s)"
        exit 1
    fi
    log "Detected OS: $OS_TYPE"
    export OS_TYPE

    SETUP_DIR="setup/$OS_TYPE"
    if [[ ! -d "$SETUP_DIR" ]]; then
        error "No setup scripts found for OS: $OS_TYPE"
        exit 1
    fi

    for script in "$SETUP_DIR"/*.sh; do
        if [[ -x "$script" ]]; then
            log "Running $script"
            "$script"
        else
            log "Skipping $script (not executable)"
        fi
    done

    log "Install script completed successfully!"
}

main "$@"

