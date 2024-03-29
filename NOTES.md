VIM Grammar 
========================
**verb + <quantifier> + noun**
quantifier are optional
verb is optional

**Vim nouns (motions)**

    h/j/k/l - left/up/down/right
    w,W - word/ Word
    b,B - back a word/ Word
    e,E - end of word, Word
    {/} - paragraph forward/ backward
    0/$ - beginning/ end of line
<quantifier><noun> 10j => go down 10 lines

**Vim verbs**

These 3 operators are enough to do 95% of editing.

    y - yank (copy)
    d - delete
    c - change
    p - paste
    . - repeat last command
    gu - lower case
    gU - upper case
    

delete a word dw
delete n words d<n>w

yank til the end of line y$

change paragraph c}

2dw is different to d2w (do delete of a word 2 times != delete 2 words)

**VIM nouns(text objects)**

Inner: i + <text_object>
Outer: a + <text_object>

```
const hello = function() {
  console.log("Hello World"); // your cursor is on letter H in Hello World
  return;
}
```
    To delete the entire "Hello World", do di(. Verb (d) + noun (i() delete inside parentesis
    To delete the entire function content, do di{. Verb (d) + noun (i{) delete inside block
    To delete the entire "Hello" string but keep "World" string, do diw. Verb (d) + noun (iw) delete inside word

common text objects

w - word
p - paragraph
( { [ < - brackets
t - HTML tags
"' - quotes

**Marks**
ma -  create a mark named a only in the current file.
'a - go back to the mark a in this file

mA - create a mark in the file but can return to it form any other file
'A - go back to the A mark on other file

**Navigation**
zz - centers the current line in the screen.
zt - scrolls to see the current line at the top

**Operations**

dt<char> - delete until char exclusive
df<char> - delete until you find a char inclusive
di'
di(
di{
J - join current line with next, remove leading spaces
gJ - join current line with next, do not remove leading spaces

:bufdo :e - reload all the buffers

**Windows actions**

<C-w><C-r> - rotate windows in a split
### lsp config
install treesitter on your path
install yapf
###Resources
https://takac.github.io/2013/01/30/vim-grammar/

https://github.com/vim/vim/issues/3629#issuecomment-440845680https://github.com/vim/vim/issues/3629#issuecomment-440845680

### Will be nice to have
a list of the lines where a particular search matches(in current file, other files, all the files, open files): Telescope plugin
lsp formatting for a selected range of lines: kind of works now on lsp. Sometimes the formatter does nothing
autocompletion of function/method parameters or a floating window for them
list of open buffers that can be searched by text or browsed with keys: Telescope plugin

### External dependencies
ripgrep
fd
tree-sitter
yapf
clangd

#### Bash commands
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb 
sudo dpkg -i ripgrep_13.0.0_amd64.deb 
sudo apt install fd-find 
ln -s $(which fdfind) ~/bin/fd 
install ccls
npm install -g @fsouza/prettierd

### Pyenv
To recompile a python version without recreate your virtual environments:
$ env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.7 -vvv 
$ pyenv rehash

### tmux
Print all colors
`for x in {0..255}; do  printf "\x1b[38;5;${x}mcolor%-5i\x1b[0m" $x ; if ! (( ($x + 1 ) % 8 )); then echo ; fi ; done`
https://cassidy.codes/blog/2019-08-03-tmux-colour-theme/
https://protechnotes.com/comprehensive-tmux-tutorial-for-beginners-with-a-cheat-sheet/
https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/

### markdown
https://www.markdownguide.org/cheat-sheet/

## Usefull plugins
Packer
nvim-lspconfig
vim-surround
nvim-treesitter
nvim-web-devicons
lualine
nvim-autopairs
telescope-file-browser
Telescope 
## Golang
install shadow linter
go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest
