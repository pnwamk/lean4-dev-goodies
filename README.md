lean4-dev-goodies
==================

Scripts to make life easier for working with multiple in-development lean4 versions.

  * `lean4-dev-alias` - bash function for setting the Lean4 environment variables
  * `lean4-dev-bin` - bash script that redirects to the appropriate lean4 binary
  * `lean4-dev-make-links` - run this to install links to the `lean4-dev-bin` script


Example setup steps:

1. ``` $ git clone [repo-url] lean4-dev-goodies && cd lean4-dev-goodies ```

2. copy the ``` lean4-dev ``` bash function from `lean4-dev-alias.bash` into your
.bashrc/.zshrc config file. (You can set the ``` BASEDIR ``` variable
in ``` lean4-dev ``` if your Lean4 installs will all share a base directory
(this potentially allows you to specify much simpler paths when changing installs)).

3. ``` $ chmod +x lean4-dev-bin && cp lean4-dev-bin /usr/local/bin/lean4-dev-bin ```

4. ``` $ chmod +x lean4-dev-make-links.sh && ./lean4-dev-make-links.sh ```

Now you can use ``` lean4-dev ``` at the command line both to print the current
Lean4 install you're pointed at:

```
dave@HAL ~ $ lean4-dev
LEAN4HOME = 
```

and to point your shell at a new Lean4 install:

```
dave@HAL ~ $ lean4-dev /Users/dave/repos/lean4/head
dave@HAL ~ $ lean4-dev
LEAN4HOME = /Users/dave/repos/lean4/head

```

N.B., `lean4-dev` expects to be pointed at a directory which directly contains a `bin` 
subdirectory which contains executables `lean`, `leanc`, and `leanmake`.

Script and layout design borrowed from https://github.com/takikawa/racket-dev-goodies
