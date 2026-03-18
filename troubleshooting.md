# Troubleshooting Known Issues

### Cloning a Repository using SSH

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