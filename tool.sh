#!/usr/bin/env bash

cmd=(stow -d . -t "$HOME" --no-folding --verbose)

case "$1" in
	up)
	${cmd[@]} */
	;;
	
	down)
	${cmd[@]} --delete */
	;;

	reload)
	${cmd[@]} --restow */
	;;

	*)
	echo "Usage: $0 <up|down|reload>"
	;;
esac
