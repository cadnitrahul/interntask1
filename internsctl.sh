#!/bin/bash

# internsctl - Custom Linux Command
# Version: v0.1.0

show_help() {
    echo "Usage: internsctl COMMAND [OPTIONS]"
    echo "  internsctl cpu getinfo      Get CPU information"
    echo "  internsctl memory getinfo   Get memory information"
    echo "  internsctl user create      Create a new user"
    echo "  internsctl user list        List all regular users"
    echo "  internsctl user list --sudo-only   List users with sudo permissions"
    echo "  internsctl file getinfo     Get information about a file"
    echo "  internsctl --help           Display this help message"
    echo "  internsctl --version        Display command version"
}

show_version() {
    echo "internsctl v0.1.0"
}

get_cpu_info() {
    lscpu
}

get_memory_info() {
    free -h
}

create_user() {
    if [ -z "$2" ]; then
        echo "Error: Missing username. Usage: internsctl user create <username>"
        exit 1
    fi
    sudo useradd -m -s /bin/bash "$2"
    echo "User $2 created successfully."
}

list_users() {
    if [ "$2" == "--sudo-only" ]; then
        getent passwd | cut -d: -f1,3,4 | awk -F: '$2 >= 1000 {print $1}' | xargs -I{} groups {} | grep -E '\bsudo\b' | cut -d: -f1
    else
        cut -d: -f1,3,4 /etc/passwd | awk -F: '$2 >= 1000 {print $1}'
    fi
}

get_file_info() {
    if [ -z "$2" ]; then
        echo "Error: Missing file name. Usage: internsctl file getinfo <file-name>"
        exit 1
    fi

    file="$2"
    size=$(stat --format=%s "$file")
    permissions=$(stat --format=%A "$file")
    owner=$(stat --format=%U "$file")
    last_modified=$(stat --format=%y "$file")

    echo "File: $file"
    echo "Access: $permissions"
    echo "Size(B): $size"
    echo "Owner: $owner"
    echo "Modify: $last_modified"
}

case $1 in
    "cpu")
        case $2 in
            "getinfo")
                get_cpu_info
                ;;
            *)
                show_help
                ;;
        esac
        ;;
    "memory")
        case $2 in
            "getinfo")
                get_memory_info
                ;;
            *)
                show_help
                ;;
        esac
        ;;
    "user")
        case $2 in
            "create")
                create_user "$@"
                ;;
            "list")
                list_users "$@"
                ;;
            *)
                show_help
                ;;
        esac
        ;;
    "file")
        case $2 in
            "getinfo")
                get_file_info "$@"
                ;;
            *)
                show_help
                ;;
        esac
        ;;
    "--help")
        show_help
        ;;
    "--version")
        show_version
        ;;
    *)
        show_help
        ;;
esac
