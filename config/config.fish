function commit
	git add --all; git commit -m  "$argv"; git push;
end

function fish_user_key_bindings
  # ctrl-del
  bind \e\[3\;5~ kill-word

  # ctrl-]
  bind \c] backward-kill-word
end

fish_user_key_bindings

set -U fish_user_paths ~/.dotnet $fish_user_paths
