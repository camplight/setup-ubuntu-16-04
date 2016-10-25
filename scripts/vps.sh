#!/usr/bin/env bash
set -eu -o pipefail

readonly FULLPATH="$(dirname "$(realpath "$0")")"

. "$FULLPATH/_utils.sh"

main() {
    remote="${1:-}"
    [[ -z $remote ]] && fail "You must provide a remote host"
    shift;

    case "${1:-}" in
        "") fail "You must provide an option" ;;
        setup)
            shift
            setup "$@"
        ;;
        *) fail "Unknown option ${1:-}"
    esac
}

setup() {
    case "${1:-}" in
        "") setup_base ;;
        mongodb) ssh -t "root@${remote}" "$(<"$FULLPATH/vps_setup_mongodb.sh")" ;;
        pm2) ssh -t "node@${remote}" "$(<"$FULLPATH/vps_setup_pm2.sh")" ;;
        *) fail "Unknown setup option ${1:-}"
    esac
}

setup_base() {
    ssh-copy-id "root@${remote}"
    ssh -t "root@${remote}" "$(<"$FULLPATH/vps_setup_base.sh")"
    ssh-copy-id "node@${remote}"
    ssh -t "node@${remote}" "$(<"$FULLPATH/vps_setup_node_env.sh")"
}

main "$@"
