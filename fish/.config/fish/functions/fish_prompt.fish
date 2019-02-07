function fish_prompt --description 'Write out the prompt'
	set -l st $status

	if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

	if test $st -eq 0
		set -e st
	else
		set st "($st)"
	end

    echo -n -s '[' (python /home/fra/.config/fish/checkunreadmail.py) '] '"$USER" "$__fish_prompt_cwd"  \
	 (__fish_vcs_prompt) ' ' (prompt_pwd) (echo $st) "$__fish_prompt_normal" '> '
end
