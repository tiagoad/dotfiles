# dotfiles

These are my personal configurations.
This is obviously very tailored to my personal use,
although it might contain things others would find useful.

Each sub-directory in this repo is a "package", which is installed into the
system using the `tool.sh` script.  

## Package configuration

Packages can have a `META` file inside which will change install configurations.

* **MODE**

  `STOW` (default): Directory will be installed as a GNU stow package (each file
    will be symlinked)  
  `SYMLINK`: Directory will be symlinked

* **DEST**

  Base directory for install. Defaults to `$HOME`.  
  Files inside each package will be mapped into this directory.