```
$ brew install bash-completion
$ brew tap homebrew/completions
```

```
# add below code to ~/.bash_profile

if [ -f $(brew --prefix)/etc/bash_completion  ]; then
. $(brew --prefix)/etc/bash_completion
fi
```
