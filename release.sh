#!/bin/bash

# ==============================================================================
# RELEASE SCRIPT WRAPPER
# ==============================================================================
# This is a minimal wrapper that downloads and executes the latest release script
# All functionality is contained in .release-exec

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# ==============================================================================
# SELF-UPDATE MECHANISM
# ==============================================================================

download_latest_script() {
    local exec_script=".release-exec"
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_warning "Not in a git repository. Cannot download latest version."
        return 1
    fi

    print_info "Checking for latest version..."
    
    # Fetch latest changes
    if git fetch origin > /dev/null 2>&1; then
        # Get the latest version of the script
        if git show "origin/HEAD:release.sh" > "$exec_script" 2>/dev/null; then
            # Make it executable
            chmod +x "$exec_script"
            print_success "Downloaded latest version as $exec_script"
            return 0
        else
            print_error "Failed to download updated script"
            return 1
        fi
    else
        print_error "Failed to fetch updates"
        return 1
    fi
}

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

main() {
    local exec_script=".release-exec"
    
    # Check if we already have the execution script
    if [[ -f "$exec_script" ]]; then
        print_info "Found existing script: $exec_script"
        print_info "Executing latest version..."
        exec "./$exec_script" "$@"
    else
        print_info "No existing script found. Downloading latest version..."
        if download_latest_script; then
            print_info "Executing downloaded version..."
            exec "./$exec_script" "$@"
        else
            print_error "Failed to download script. Cannot continue."
            exit 1
        fi
    fi
}

main "$@"