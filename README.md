lean4-dev-goodies
==================

Scripts to make life easier for working with multiple in-development Lean4 versions
by creating symbolic links for `lean` and related executables that are redirected 
on a per-terminal (environment) basis to the desired Lean4 installations.

  * `lean4-dev-alias.bash` - contains a bash function `lean4-dev` for inspecting/selecting
    a Lean4 installation
  * `lean4-dev-bin` - a bash script that redirects each executable to the appropriate Lean4 binary
  * `lean4-dev-make-links.sh` - run this to install links to the `lean4-dev-bin` script



## Setup

1. ``` git clone URL lean4-dev-goodies && cd lean4-dev-goodies ```

2. Copy the ``` lean4-dev ``` bash function from `lean4-dev-alias.bash` into your
.bashrc/.zshrc config file. (N.B., you can set the ``` BASEDIR ``` variable
within the bash function ``` lean4-dev ``` if your Lean4 installs will all share 
a base directory (allowing simpler paths when changing installations)).

3. ``` chmod +x lean4-dev-bin && cp lean4-dev-bin /usr/local/bin/lean4-dev-bin ```

4. ``` chmod +x lean4-dev-make-links.sh && ./lean4-dev-make-links.sh ```

## Usage

Once setup, the `lean` and related symlinks created by `lean4-dev-make-links.sh`
will point to whichever installation has been selected by the ``` lean4-dev ```.

For example, we can see which (if any) Lean4 installation is selected:

```
dave@HAL ~ $ lean4-dev
LEAN4HOME = 
```

If none is selected, the `lean` and related executables will not function:

```
dave@HAL ~ $ lean
lean: LEAN4HOME has not been set.
```

To select an installation, pass ``` lean4-dev ``` an installation directory
(i.e., a directory `DIR` such that `DIR/bin` contains binaries `lean`, `leanc`, and `leanmake`):

```
dave@HAL ~ $ lean4-dev /Users/dave/repos/lean4/head
dave@HAL ~ $ lean
Expected exactly one file name
Lean (version 4.0.0, commit a04fc631e07b, debug)
```

Again, the currently selected installation can be inspected via `lean4-dev`:

```
dave@HAL ~ $ lean4-dev
LEAN4HOME = /Users/dave/repos/lean4/head
```

Script and layout design borrowed from https://github.com/takikawa/racket-dev-goodies
