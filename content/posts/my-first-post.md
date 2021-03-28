---
title: "Minimalistic Dotfile Management"
date: 2020-09-15T11:05:52-05:00
draft: false
tags: 
- software
---

Keeping your dotfiles in source control makes them consistent across time (e.g., revert to a previous version) and space (e.g., deploy to a new environment) and makes them shareable with the world. This isn't new. But what incantation of symlinks, submodules, and scripts is best?

I prefer to use vanilla Git.

## Setup

Start by initializing a Git repository in your home directory. Then exclude everything.

```sh
git init && echo '*' > .gitignore
```

Whitelisting has a lot of benefits. Most importantly, `git clean` won't wipe all untracked files.

Selectively add files to Git:

```sh
git add -f .vimrc
```

You must pass the `-f` option to `git add` since all files necessarily match your exclude pattern.

If you use plugins for things like Vim or Zsh, you can add them as Git submodules: 

```sh
git submodule add -f git@github.com:tpope/vim-commentary.git .vim/bundle/
```

Here's how to replicate this on a new workstation:

```sh
cd ~
git init .
git remote add origin <dotfiles-repo-url>
git pull origin master
```

And that's it. No symlinks, no install scripts, just plain ole Git.

Here's what [my dotfiles repository](https://github.com/dempe/dotfiles) looks like.

## Alternative Methods

[Many](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) [methods](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/) [for](https://medium.com/@driesvints/getting-started-with-dotfiles-76bf046d035c) [tracking](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) [dotfiles](https://github.com/ryanb/dotfiles) revolve around a dedicated dotfile directory with symlinks to the home directory. (Or symlinks to anywhere, really. This method does have the benefit of allowing you to add config files outside `~`.)
This is unnecessarily cumbersome. It requires you to have some sort of an install script or, worse yet, [a](https://www.gnu.org/software/stow/) [program](https://github.com/deadc0de6/dotdrop) [for](https://github.com/jbernard/dotfiles) [managing](https://github.com/andsens/homeshick) [your](https://github.com/RichiH/vcsh) [symlinks](https://github.com/TheLocehiliosan/yadm). In addition to this, you still need Git. So why not just go with vanilla Git?

## Troubleshooting

* If you want to remove a file from Git, use `git rm --cached <file>`. If you do not pass the `--cached` option, the file will be removed from disk (you'll still be able to retrieve the lost data from `git reflog`).
* Be wary of adding lots of files at once. In general with Git, I like to keep my commits as discrete as possible. This allows me to more easily undo or apply changes.
* Be wary of unstaging added files. Use `git rm --cached` or a soft reset, `git reset`. If you do a hard reset (`git reset --hard HEAD`), the files will not merely be unstaged - they will also be deleted. If this happens, not even `git reflog` can help you (since the files were never a part of any commit). You will have to look through the blobs in `.git/lost-found/other` to retrieve the deleted files.

