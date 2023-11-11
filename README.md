# Getting Started :
# NeoVIM
wget https://github.com/rayanramoul/nvim-configs ~/.config/nvim

and then run all the .sh scripts in that directory!

### Neovim Keybinds :
Reference  for Tutorial : https://ofirgall.github.io/learn-nvim/chapters/00-why-should-i-learn.html
| Keybinding  | Description |
| ------------- | ------------- |

Explore Project :
| Ctrl p | Telescope lookup a file |
| Space pv | Go back to file explorer |
| Space + fs | File search |
| Ctrl + f | Tmux Jump Between projects |
| % | Create a new file |
| d | Create a new directory |
| Ctrl e | Toggle/Show harpoon menu |
| D (in file explorer | Delete file |
| Harpoon Space a | Add file |
| Harpoon Ctrl e | toggle quick menu |
| Harpoon Ctrl h | nav file 1 |  
| Harpoon Ctrl t | nav file 2 |  
| Harpoon Ctrl n | nav file 3 |  
| Harpoon Ctrl s | nav file 4 |  

In File
| y y p | Duplicate line |
| d | Create a new directory |
| dd | Delete a line |
| f + Character | Search/go-to where the caracter appears in the line |
| Space u | Open Undo tree |
| Space gs | Open Fugitive Git manipulation |
| { | Jump previous paragraph | 

LSP :
| Ctrl y | Accept an LSP suggestion |
| Ctrl n | Next LSP suggestion |
| Ctrl p | Previous LSP suggestion |
| g d | Previous LSP suggestion |
# The vim Language
## Buffers, Splits/Windows and Tabs

-   Buffers - buffer is an open file, which can be edited from multiple splits
-   Splits/Windows - splits aka windows are the panes which you can move through
-   Tabs - tab is a set of splits, like a tab in a terminal, people don't use it very often.

Binds

-   :e <file> - will open a new file (buffer)
-   :b <buffer> - will switch to an already opened file (buffer)
-   :vsplit - will open a vertical split
-   :split - will open a horizontal split
-   use :help tab-page to read more about tabs (they're not very necessary)

Keybinds

Often you'll see a keybind described as something like that: ggyG - which copies the entire buffer.
All the signs in the keybind are meant to be pressed as you type them.
To execute this bind you'll need to press:

-   gg - move to the top of the file
-   y - start a copy
-   shift+g - end the copy from the cursor to the end of the file

In vim you don't hold the keys in order to complete a key sequence as you type them, and you can configure the timeoutlen to make vim wait more/less between keystrokes.
Keybinds naming

You don't need to memorize keybinds as the letter stands for its action.

-   y - yank
-   p - paste

Each time where I introduce an action in this guide, I'll mark the letter I use to remember the bind.
Special Keys

-   <cmd> - is : which starts a cmd
-   <cr> - is enter
-   <Esc> - is Escape
-   <C-x> - is Ctrl+x
-   <M-x> - is alt+x
-   <M-X> - is alt+shift+x
-   <A-x> - is alt+x
-   <A-X> - is alt+shift+x
-   <leader> - is the leader key
## Leader

vim maps most of the keyboard by default, <leader> acts as a prefix for custom user binds.
Leader is remappable, the default mapping is , most vim users change it to <Space>
Help

There's a help page for everything, start using it as soon as possible, it's like man just better and for vim.
Modes

There are a lot of modes in vim, I'll cover the important ones.
To exit from each mode back to normal press Escape. I recommend remapping it to capslock, you're going to press it a lot and it will be much easier to use the pinky without moving your hands.

-   Normal - This is where you will be usually, you can move, copy in this mode, and much more
-   Insert (i) - Insert text to the buffer, you want to be in this mode only when you're actually inserting text, you don't want to move in this mode
-   Visual (v) - Select and copy/replace text
-   Visual Line (V) - Select and copy/replace text by lines
-   Command (:,/) - Inserting a command

Movements and Operators

vim is built on actions that are mostly built on 2 types, an operator and a movement.
Basic binds

    i - enter Insert mode
    a - enter insert mode After the cursor
    I - enter Insert mode at the beginning of the line
    A - enter insert mode at the end of the line (same as a but for the entire line)
    o - insert new line below
    O - insert new line above
    u - Undo, check out undotree
    Ctrl-r - Redo
    zz - Recenter the screen, there are more binds for screen actions but this is the most important one

Basic movements
Arrows

    h - left
    j - down
    k - up
    l - right

It takes some time getting used to it but it's worth it, I recommend disabling the arrow keys for movement and try the game hjkl in vim-be-good.

-- Disable arrows movement
map('', '<Up>', '<Nop>')
map('', '<Down>', '<Nop>')
map('', '<Left>', '<Nop>')
map('', '<Right>', '<Nop>')

Multiply Movement

You can multiply every movement by entering a number before the movement.
For example: 3j will jump 3 lines down
Words

    w - jump Word forward
    b - jump word Backwards
    e - jump forward to the End of the word
    ge - jump to the End of the previous word

Capital will change the behavior from word to WORD, read :help word and :help WORD to understand the differences
Generics

    0 - go to the beginning of the line
    $ - go to the end of the line
    <C-u> - go Up half a page
    <C-d> - go Down half a page
    % - jump to the pair of the bracket/quote/ifdef your cursor on
    <C-o> - jump to the previous position you jumped from (you can do it multiple times)
    <C-i> - jump to the next position you jumped to (you can do it multiple times)

Pair Movments

The standard way to jump forward to something is ] and backward is [.

Some examples

    ]m / [m - Jump to Method
    ]] / [[ - Jump to section
    } / { - Jump to paragraph
    ]c / [c - Jump to diff (Change)

I suggest to install vim-unimpaired which adds more pair movements.
Searching
Search across the file

These are not movements!

    / - to start a forward search
    ? - to start a backward search
    n - go to the Next occurrence
    N - go to the previous occurrence
    * - forward search the current word under cursor
    # - backward search the current word under cursor

I recommend to remap n and N to nzz and Nzz, zz centers the screen by the line you are on, these binds will go to the next/prev occurrence and center the screen.

map('n', 'n', 'nzz') -- Auto recenter after n
map('n', 'N', 'Nzz') -- Auto recenter after N

If you enabled opt.ignorecase you can add \C at the end of your search to re-enable case.
Quick search

These are movements! You will need to enter a char after the quick search key.

    f - jump to the next char, I remember it as Find
    F - jump to the previous char, I remember it as Find
    t - jump Till the next char (1 char before the occurrence)
    T - jump Till the prev char (1 char after the occurrence)

These movements are very useful to manipulate text in the same line. This is the reason I enable opt.wrap in vim.

I highly recommend installing clever-f.vim it will help you get used to these awesome movements fast.
Operators

The main ones

    y - Yank (copy)
    d - Delete
    c - Change, delete the text and enters insert mode
    < - remove indentation (left)
    > - add indentation (right)
    = - auto indent
    gc - Comment/Uncomment, done with Comment.nvim

Capital (shift) will apply the operation starting from the cursor to the end of the line, e.g: D deletes the line from the cursor to the end of the line.
Repeating the operator key will apply the operation for the entire line, e.g: yy yanks the entire current line.
Action

Action is an operator + movement
For example:

    y3k - yank 2 lines above the cursor, including the current line.
    ct, - change the text until ,, very useful to change function arguments and more.

This is why you must have relativenumber on, it will make your life much easier.
"Special" actions

    Hit the operator twice to activate it on the current line. yy will yank the entire line you are on.
    Shift+operator to activate the operator from the cursor the end of the line. C will change the line from the cursor to the end.

One char actions

Actions without movement

    x - delete the char you are on.
    X - delete 1 char before the cursor.
    r - Replace 1 char

How should I remember all those binds?

Think of a key sequence as an English sentence.

For example: when I'm using y3j/y3<Enter> I'll think of it as yank 3 down, in my mind I "speak" with the editor rather than remembering which keys to press.
