# vim-git-stage-hunk

A Vim file-type plugin to help stage git diff hunks.

## Installation
Install using your favorite package manager, or use Vim's built-in package support.

### Install with vim-plug

If you're using [vim-plug](https://github.com/junegunn/vim-plug) you can add this plugin with the following lines in your `.vimrc`.

```
call plug#begin()

Plug 'salcode/vim-git-stage-hunk'

call plug#end()
```

## Description

When manually staging a Git hunk, the changes are more likely to successfully apply when the range information of the Unified Diff Format (e.g. `@@ -1,3 +1,9 @@`) is modified. The `:GitHunkToggle` command and the mapping that points to this command, provide shortcuts to modifying the diff and the Unified Diff Format definition line.

### Command

The `:GitHunkToggle` command behaves differently depending on the type of line as determined by the first character on the line

- minus (`-`) this line is marked for deletion, the command removes the deletion (i.e. replaces the `-` with a space)
- plus (`+`) this line is marked as an addition, the command eliminates the line from the hunk by removing the line entirely
- space (` `) this line is part of the diff for reference, the command will mark the line for deletion by converting the first character which is a space (` `) to a minus (`-`)

### Mapping

By default `<space><space>` is mapped to the `:GitHunkToggle` command

#### Custom Mapping

We can override the default mapping with a line like the following in our `.vimrc`. This will map `,h` to the `:GitHunkToggle` command in normal mode.

```
" Map ,h to :GitHunkToggle (in normal mode),
" default mapping in the plugin will not be applied.
nnoremap <buffer><silent> ,h :GitHunkToggle<CR>
```

When a custom mapping like this is assigned, the default mapping is NOT set.

## About

You can find this plugin online at
https://github.com/salcode/vim-git-stage-hunk

## License

Copyright (c) Sal Ferrarello. Distributed under the apache-2.0 license.
