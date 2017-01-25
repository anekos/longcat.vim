"     /\___/\
"    /       \
"   |  o    o |
"   \     #   |
"    \   _|_ /
"    /       \______
"   / _______ ___   \
"   |_____   \   \__/
"    |    \__/
"    |   L   |
"    |   o   |
"    |   n   |
"    |   g   |
"    |       |
"    |   c   |
"    |   a   |
"    |   t   |
"    |       |
"    |   i   |
"    |   s   |
"    |       |
"    |   l   |
"    |   o   |
"    |   n   |
"    |   g   |
"    /        \
"   /   ____   \
"   |  /    \  |
"   | |      | |
"  /  |      |  \
"  \__/      \__/


let s:save_cpo = &cpo
set cpo&vim


command! -bang -nargs=* LongCat call longcat#spawn(<bang>0, <q-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
