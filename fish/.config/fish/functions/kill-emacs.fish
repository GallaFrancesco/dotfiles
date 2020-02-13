# Defined in - @ line 1
function kill-emacs --description alias\ kill-emacs=emacsclient\ -e\ \'\(kill-emacs\)\'
	emacsclient -e '(kill-emacs)' $argv;
end
