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


" Returns `n` long cat lines
function! longcat#breed(is_tatoo, n) abort
  let l:top = copy([
    \ '    /\___/\',
    \ '   /       \',
    \ '  |  o    o |',
    \ '  \     #   |',
    \ '   \   _|_ /',
    \ '   /       \______',
    \ '  / _______ ___   \',
    \ '  |_____   \   \__/',
    \ '   |    \__/'
    \ ])

  let l:middle = '   |       |'
  let l:middle_c = '   |   %   |'

  let l:bottom = copy([
    \ '   /        \',
    \ '  /   ____   \',
    \ '  |  /    \  |',
    \ '  | |      | |',
    \ ' /  |      |  \',
    \ ' \__/      \__/'
    \ ])

  let l:middles = []
  if a:is_tatoo
    for l:i in range(0, len(a:n) - 1)
      let l:middles = add(l:middles, substitute(l:middle_c, '%', a:n[l:i], ''))
    endfor
  else
    for l:_ in range(1, str2nr(a:n))
      let l:middles = add(l:middles, l:middle)
    endfor
  endif

  return extend(extend(l:top, l:middles), l:bottom)
endfunction


" Spawn in current buffer
function! longcat#spawn(is_tatoo, n) abort
  call append(line('.'), longcat#breed(a:is_tatoo, a:n))
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
