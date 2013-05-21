Bash Snippets
=============

h3. Die unless arguments are correct
--------------------------------

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "Usage: $0 <serverhost> 
