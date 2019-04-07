#!/usr/bin/env bash

# go to script dir
cd "$(dirname "$0")"

usage() {
	echo "Usage: $0 <up|down>"
}

for pack in */; do
	# remove trailing /
	pack=${pack%?};

	# defaults
	MODE=STOW
	DEST=$HOME

	# load META
	source "$pack/_META" 2>/dev/null

	echo "----------------------"
	echo "Package: $pack"
	echo "Mode:    $MODE"
	echo "Dest:    $DEST"

	if [ "$1" = "up" ]; then
		if [ "$MODE" = "STOW" ]; then
			# stow
			stow \
				--stow \
				-d "$PWD" \
				-t "$DEST" \
				--no-folding \
				--ignore '_META' \
				"$pack"

		elif [ "$MODE" = "SYMLINK" ]; then
			# symlink
			if [ -e "$DEST/$pack" ]; then
				if [ ! -h "$DEST/$pack" ]; then
					echo "Destination already exists, and is not a symlink."
				else
					echo "Symlink already exists"
				fi
			else
				ln -s "$PWD/$pack" "$DEST"
			fi
		fi

	elif [ "$1" = "down" ]; then
		if [ "$MODE" == "STOW" ]; then
			# unstow
			stow \
				--delete \
				-d "$PWD" \
				-t "$DEST" \
				"$pack"

		elif [ "$MODE" = "SYMLINK" ]; then
			# unsymlink
			if [ -h "$DEST/$pack" ]; then
				rm "$DEST/$pack"

			elif [ -e "$DEST/$pack" ]; then
				echo "$DEST/$pack is not a symlink. Can't delete."

			else
				echo "$DEST/$pack does not exist."
			fi
		fi
	fi
done
