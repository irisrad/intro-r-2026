# Troubleshooting Known Issues

## Git Fork Diverged from Main Repo

If you are trying to synchronize your fork with this repository and you get an error message like:

```
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint:
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.
```

This is most likely because the `main` branch of this repository has undergone a `rebase` since you made your fork.

To resolve this from the `main` branch in your local copy of your fork:

```bash
# save a copy of your current main branch as the branch old-main
git checkout -b old-main main
git branch -D main
# point git at the main repo, if you haven't already
git remote add upstream git@github.com:PSUTrec/intro-r-2026.git
git fetch upstream
git checkout upstream/main
git switch -c main
# this will replace the main branch on your fork on GitHub with the current main branch of the main repo
git push -fu origin main
# to get a commit you already had on your main branch before doing this into the new version of main, find the commit id with
git log
# then, pray that you don't have any merge conflicts and replace COMMIT with the id
git cherry-pick COMMIT
```

## Cloning a Repository using SSH

While trying to run `git clone`, you may receive an error message that says:

```
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

Look carefully: if the beginning of the error message just says `git@github.com`, try following the troubleshooting instructions [here](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey).

If instead you are using Git Bash on Windows and the beginning of the error message says `\302\226git@github.com`, you have probably tried to paste the URL with `Ctrl+Shift+V`, which does not paste in Git Bash on Windows, but instead inserts an invisible character that gets interpreted as part of the URL.

Right-click and select `Paste` instead, or right-click on the title bar of Git Bash, select `Options`, navigate to `Keys` on the left, and check the box for `Ctrl+Shift+letter shortcuts` to enable pasting with `Ctrl+Shift+V`.

([Source](https://gist.github.com/billythedummy/3cef0a8817bff7ca57ab33abf48b3771?permalink_comment_id=4541243#gistcomment-4541243))
