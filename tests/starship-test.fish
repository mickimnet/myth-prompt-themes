# Starship prompt test function
# (c) 2020 by Mick Hohmann, last changed 2020-10-21 21:35
function starship-test --description 'Test function to configure prompts for starship'
	## configure general parameter (will be commandline paramters later)
	set --local __config_files "/Users/mick/Sources/themes/prompt-examples/starship-default-pointed-nf.toml" "/Users/mick/Sources/themes/prompt-examples/starship-default-nf.toml"
	set --local __folders "rust-project" "shuttle" "infra" "python-project"
								# /Users/mick/Sources/themes/myth-dimensions/myth-prompt-themes/dark/pointed/starship/starship.toml
								# /Users/mick/Sources/themes/myth-dimensions/myth-prompt-themes/dark/slanted/starship/starship.toml
								# /Users/mick/Sources/themes/prompt-examples/starship-default.toml
	set --local __display_mode "quick" # "preview" "quick" "standard" "long"
	set --local __display_user "jefferson"
	set --local __display_hostname "airplane"
	set --local __base_folder "/Users/mick/Sources/themes/prompts/" # ommit the HOME shorthand, doesn't work with it
	set --local __docker_context "aquanaut"

	## script init
	set --local __current_folder (pwd)
	set --local __current_hostname (hostname -s)
	set --local --export USER $__display_user
	set --local --export LOGNAME $__display_user
	sudo hostname $__display_hostname
	set --local --export CMD_DURATION 0
	docker context use $__docker_context >/dev/null
	switch __display_mode
		case preview
			set --local __folders "rust-project" "shuttle" "infra" "python-project"
			set --local __base_folder "/Users/mick/Sources/"
		case quick
			set --local __folders "nothings/gonna/stop/us/now" "starbase" "nebula" "rust-project"
		case standard
			set --local __folders "nothings/gonna/stop/us/now" "starbase" "nebula" "shuttle" "infra" "elixir" "go" "node" "python-project" "rust-project" "swift"
		case long
			set --local __folders "nothings/gonna/stop/us/now" "starbase" "nebula" "shuttle" "infra" "elixir" "go" "node" "python-project" "rust-project" "swift" "lang/cmake" "lang/crystal" "lang/dart" "lang/dotnet" "lang/elm" "lang/erlang" "lang/java" "lang/julia" "lang/nim" "lang/ocaml" "lang/perl" "lang/php" "lang/purescript" "lang/ruby" "lang/zig"
		case '*'
	end
	## don't forget the following: "duration" "status-aheadbehind" "status-changed" "status-tocommit" "status-untracked"

	# create enough space for the screenshots
	if string match --quiet $__display_mode "preview"
		echo -e "\n\n\n\n"
	else
		echo
	end

	## iteration through the config files
	if not set --query __config_files
		echo "No config, no cookies ;)"
	end
	set --local --export __counter 1
	for __config in $__config_files
		set_color --background "#FFE792" "black"; echo -n "--------- Testing config $__config --------- "; set_color normal;
		## setup the config files
		set --local __config_filename $__base_folder"starship-test-$__counter.toml"
		cp $__config $__config_filename
		set --local --export STARSHIP_CONFIG $__config_filename
		## Print out the input carret
		set_color --background white; echo -n " "; set_color normal; echo
		## create base config values
		starship config username.disabled true
		starship config directory.truncation_length 1
		starship config directory.substitutions ""
		starship config cmd_duration.disabled true
		# \\\\\ iteration over folders
		for __directory in $__folders
			cd $__base_folder$__directory
			switch $__directory
				case nothings/gonna/stop/us/now
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "$__directory"; set_color normal
					starship config battery.disabled false
					# starship config battery.display.threshold 100
					starship config memory_usage.disabled false
					starship config time.disabled false
					starship config time.time_format "%T"
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config battery.disabled true
					# starship config battery.display.threshold 10
					starship config memory_usage.disabled true
					starship config time.disabled true
					starship config time.time_format ""
				case starbase
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../../../../../$__directory"; set_color normal
					echo
					starship config env_var.disabled false
					starship config env_var.variable "shell"
					starship config env_var.default "fish"
					starship config jobs.disabled false
					starship config shlvl.disabled false
					starship config shlvl.threshold 0
					starship config status.disabled false
					false
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config env_var.disabled true
					starship config jobs.disabled true
					starship config shlvl.disabled true
					starship config shlvl.threshold 2
					starship config status.disabled true
				case nebula
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					starship config hostname.ssh_only false
					starship config username.disabled false
					starship config username.show_always true
					set --export AWS_REGION "eu-central-1"
					set --export AWS_PROFILE "astronauts"
					set --export SINGULARITY_NAME "Starluarity"
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config hostname.ssh_only true
					starship config username.disabled true
					set --erase AWS_PROFILE
					set --erase AWS_REGION
					set --erase SINGULARITY_NAME
				case shuttle
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					# starship config kubernetes.disabled false
					# set --export KUBECONFIG "$__base_folder$__directory/.kube-config"
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config kubernetes.disabled true
					set --erase KUBECONFIG
				case infra
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					set --export NIXOPS_DEPLOYMENT "myth"
					# set --export name "myth-deployment"
					set --export name "star-deploy"
					set --export IN_NIX_SHELL "impure"
					# set --export IN_NIX_SHELL "pure"
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					set --erase NIXOPS_DEPLOYMENT
					set --erase IN_NIX_SHELL
					set --erase name
				case elixir
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
				case go
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
				case node
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
				case python-project
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					starship config cmd_duration.disabled false
					set --export CMD_DURATION 7000
					# sleep 0.5
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config cmd_duration.min_time 2_000
				case lang/ruby
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					set --export CONDA_DEFAULT_ENV "packonauts"
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					set --erase CONDA_DEFAULT_ENV
				case rust-project
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					starship config package.disabled true
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
					starship config package.disabled false
				case swift
					set_color white; echo -n "cd "; set_color --underline cyan; echo -n "../$__directory"; set_color normal
					echo
					set --local exit_code $status
					set --local starship_duration "$CMD_DURATION$cmd_duration"
					"/usr/local/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
				case '*'
			end
		end
		# ///// iteration over folders
		## Print out the input carret
		set_color --background white; echo -n " "; set_color normal; echo
		## prepare for the next run
		## create enough space for the screenshots
		if string match --quiet $__display_mode "preview"
			echo -e "\n\n\n\n\n\n\n\n"
		else
			echo -e "\n\n"
		end
		set __counter (math $__counter + 1)
		## clean up
		rm $__config_filename
	end

	# create enough space for the screenshots at the end
	if string match --quiet $__display_mode "preview"
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	end

	## script cleanup
	cd $__current_folder
	sudo hostname $__current_hostname
	docker context use default >/dev/null
end
#EOF.
