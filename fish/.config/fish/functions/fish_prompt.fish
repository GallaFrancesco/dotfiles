function fish_prompt --description 'Write out the prompt'
	set -l st $status

	if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    echo -n -s "$USER" ' ' "$__fish_prompt_cwd" (prompt_pwd) \
	(__fish_vcs_prompt)    \
	"$__fish_prompt_normal" '> '
end
