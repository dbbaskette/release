#!/bin/bash

# ==============================================================================
# INSTALLER SCRIPT FOR PROJECT RELEASE
# ==============================================================================
# This script copies the release script and its configuration to a target
# project directory.

# --- Colors and Styles ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# --- Emojis ---
ROCKET="🚀"
BOX="📦"
CHECK_MARK="✅"
CROSS_MARK="❌"
FOLDER="📁"
WRENCH="🔧"
INFO="ℹ️"
SPARKLES="✨"

# --- Functions for printing formatted output ---

print_header() {
    echo -e "${PURPLE}${BOLD}================================================${NC}"
    echo -e "${PURPLE}${BOLD} ${SPARKLES} Project Release Script Installer ${SPARKLES} ${NC}"
    echo -e "${PURPLE}${BOLD}================================================${NC}"
    echo
}

print_info() {
    echo -e "${BLUE}${BOLD}${INFO} [INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}${BOLD}${CHECK_MARK} [SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}${BOLD}${CROSS_MARK} [ERROR]${NC} $1" >&2
}

print_usage() {
    echo -e "${YELLOW}Usage: $0 /path/to/your/project${NC}"
    echo -e "Copies ${CYAN}release.sh${NC} and ${CYAN}.release.conf${NC} to the specified project directory."
}

# --- Main Logic ---

main() {
    print_header

    local target_dir="$1"
    local source_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    local release_script="release.sh"
    local release_conf=".release.conf"

    # 1. Check for target directory argument
    if [ -z "$target_dir" ]; then
        print_error "No project directory provided."
        print_usage
        exit 1
    fi

    print_info "Target project directory: ${CYAN}$target_dir${NC}"

    # 2. Check if the target directory exists
    if [ ! -d "$target_dir" ]; then
        print_error "Directory '${BOLD}$target_dir${NC}' does not exist."
        exit 1
    fi
    print_success "Directory found."

    # 3. Check if source files exist
    print_info "Checking for source files in ${CYAN}$source_dir${NC}..."
    if [ ! -f "$source_dir/$release_script" ]; then
        print_error "Source file '${BOLD}$release_script${NC}' not found."
        exit 1
    fi
    if [ ! -f "$source_dir/$release_conf" ]; then
        print_error "Source file '${BOLD}$release_conf${NC}' not found."
        exit 1
    fi
    print_success "Source files are present."

    # 4. Copy the files
    echo
    print_info "${WRENCH} Installing files..."
    
    cp "$source_dir/$release_script" "$target_dir/"
    if [ $? -eq 0 ]; then
        print_success "Copied ${BOLD}$release_script${NC} to ${CYAN}$target_dir/${NC}"
    else
        print_error "Failed to copy ${BOLD}$release_script${NC}."
        exit 1
    fi

    cp "$source_dir/$release_conf" "$target_dir/"
    if [ $? -eq 0 ]; then
        print_success "Copied ${BOLD}$release_conf${NC} to ${CYAN}$target_dir/${NC}"
    else
        print_error "Failed to copy ${BOLD}$release_conf${NC}."
        exit 1
    fi

    # 5. Make the script executable in the target directory
    chmod +x "$target_dir/$release_script"
    if [ $? -eq 0 ]; then
        print_success "Made ${BOLD}$release_script${NC} executable in the target directory."
    else
        print_error "Failed to make ${BOLD}$release_script${NC} executable."
        exit 1
    fi

    echo
    print_success "${ROCKET}${SPARKLES} Installation complete! ${SPARKLES}${ROCKET}"
    print_info "You can now 'cd' into your project and run './release.sh'."
}

# Run the main function with all script arguments
main "$@"
