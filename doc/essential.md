The 25 most essential emacs commands
====================================

To enter emacs, type into a terminal
emacs &
In the following emacs commands, C means the Control key (Ctrl) and 
M means the meta key which on many keyboards is the Escape key (Esc).
The commands marked * are those you will most likely use most.

read a file into Emacs (existing or new)           C-x C-f    *
save a file back to disk                           C-x C-s    *
insert contents of another file into this buffer   C-x i
write buffer to a specified file                   C-x C-w

exit Emacs permanently                             C-x C-c

search forward                                     C-s        *
search backward                                    C-r        *

go to line beginning                               C-a 
go to line end                                     C-e

undo an unwanted change                            C-_
abort partially typed or executing command         C-g

kill rest of line (starting with cursor position)  C-k        *
yank back last thing killed                        C-y        *

delete all other windows                           C-x 1
delete this window                                 C-x 0
split window in two vertically                     C-x 2
split window in two horizontally                   C-x 3
switch cursor to another window                    C-x o

select another buffer                              C-x b
list all buffers                                   C-x C-b
kill a buffer                                      C-x k

interactively replace a text string                M-%  

check spelling of current word                     M-$
check spelling of entire buffer                    M-x ispell-buffer

complete word     	 			   M-/