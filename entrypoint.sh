#!/bin/sh
set -e

# Prepend "psi" if the first argument is not an executable
if ! type -- "$1" &> /dev/null; then
#	set -- pdftoppm "$@"
	set -- /latex2png.sh

fi

exec "$@"
