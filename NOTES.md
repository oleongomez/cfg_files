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
????

###Resources
https://takac.github.io/2013/01/30/vim-grammar/