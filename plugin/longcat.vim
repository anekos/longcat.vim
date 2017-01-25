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


function! s:longcat_command(bang, n)
  if a:bang
    if a:n ==# ''
      call longcat#spawn(1, 'Long cat is long.')
    else
      call longcat#spawn(1, a:n)
    endif
  else
    if a:n ==# ''
      call longcat#spawn(0, 20)
    elseif a:n =~# '^\v\d+$'
      call longcat#spawn(0, str2nr(a:n))
    else
      call longcat#spawn(1, a:n)
    endif
  end
endfunction


command! -bang -nargs=* LongCat call s:longcat_command(<bang>0, <q-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
