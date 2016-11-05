echo '* atom'
cp ~/.atom/keymap.cson ./atom/
cp ~/.atom/config.cson ./atom/
cp ~/.atom/styles.less ./atom/
ls -lrt ~/.atom/packages | awk 'NF == 9 && $9 != "README.md" {printf "%s-%02s-%s %s\n", $6, $7, $8, $9}' > ./atom/packages_screenshot.md
#echo '* sublime_text keymap'
#cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap ./sublime_text/
#echo '* sublime_text settings'
#cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ./sublime_text/
#echo '* zshrc'
#cp ~/.zshrc ./iterm2+zsh/zshrc
#echo '* vimrc'
#cp ~/.vimrc ./vim/vimrc
#echo '* bash_profile'
#cp ~/.bash_profile ./bash_profile
