function! s:UnAddLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Decrement the value under the cursor.
	execute ':normal ' . "\<C-X>"
	" Restore position
	call winrestview(position)
	" Delete current line
	execute ":normal dd"
endfunction

function! s:UnDeleteLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Increment the value under the cursor.
	execute ':normal ' . "\<C-A>"
	" Restore position
	call winrestview(position)
	" Remove the leading - sign
	execute "normal 0r "
endfunction

function! s:DeleteLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Decrement the value under the cursor.
	execute ':normal ' . "\<C-X>"
	" Restore position
	call winrestview(position)
	" Add a leading - sign
	execute "normal 0r-"
endfunction

function! s:GitHunkToggle()
	echo "salcode GitHunkToggle"
	if s:IsFirstCharacter('-')
		call s:UnDeleteLine()
	elseif s:IsFirstCharacter('+')
		call s:UnAddLine()
	elseif s:IsFirstCharacter(' ')
		call s:DeleteLine()
	endif
endfunction

command! -nargs=0 GitHunkToggle call s:GitHunkToggle()

function! s:IsFirstCharacter(characterToCompare) abort
	let l:rowContent           = getline('.')
	let l:colPos               = col('.')
	let l:firstCharacter = strpart( l:rowContent, 0, 1)
	" echo l:firstCharacter
	if l:firstCharacter ==# a:characterToCompare
		return 1
	endif
endfunction
