# Troubleshooting Known Issues

## Cloning a Repository using SSH from Git Bash on Windows

If you are trying to run `git clone` from Git Bash on Windows using SSH (meaning the URL looks like `git@github.com:PSUTrec/intro-r-2026.git`) and you are receiving an error message like this one (note the `\302\226` at the start of the URL):

```
\302\226git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

You have probably tried to paste the URL with `Ctrl+Shift+V`, which does not paste in Git Bash on Windows, but instead inserts an invisible character that gets interpreted as part of the URL.

Right-click and select `Paste` instead, or right-click on the title bar of Git Bash, select `Options`, navigate to `Keys` on the left, and check the box for `Ctrl+Shift+letter shortcuts` to enable pasting with `Ctrl+Shift+V`.

([Source](https://gist.github.com/billythedummy/3cef0a8817bff7ca57ab33abf48b3771?permalink_comment_id=4541243#gistcomment-4541243))

If you are receiving an error that looks like this without the `\302\226` at the beginning of the URL, you can try the troubleshooting steps [here](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey).
