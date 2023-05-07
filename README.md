# M.y.t.h.: prompt themes

> "**Don't pick up hitchhikers!"** <_D. Adams_> (Excerpt from [Myth-ion Improbable][bookquote])

[![licence badge]][licence] [![stars badge]][stargazer] [![issues badge]][issues]
<!-- [![donation badge]][donate] -->

## Introduction

This will be a collection of prompt themes, for different prompt tools. Currently, supporting only [Starship][starship]. You can directly download an individual configuration or clone the whole repository to get all.

The prompts are styled as a single-line prompt, based on the [Powerline style][powerline]. All symbols make use of [Nerd Fonts][nerdfonts], therefore you need a compatible font to see the symbols. The coloring requires a terminal with support for true color (24-bit). The configuration is tested with the [Nerd Font][nerdfonts] variants of [FiraCode][firacode], [Hack][hack], and [Victor][victor] (the configuration files include additional symbols if you don't like the defaults).

## Starship

The configuration (aka theme) for [Starship][starship], covers **all** modules up to _Starship_ version 1.14.2. There are (currently) two variants: one (_general_) for shells with right prompt support ([cmd][cmd], [elvish][elvish], [Fish Shell][fish], [nushell][nushell], [xonsh][xonsh], [zsh][zsh]), and one for those which don't support it (called _left_only_).

There are custom modules for _username_ and _hostname_, as I prefer different visibility in `tmux` sessions. Otherwise, they function like the standard modules, meaning the _username_ is only shown in a `ssh` session, or a different user (like root or different from `$LOGNAME`), and the _hostname_ is only shown in a `ssh` session. In a (remote) `tmux` session, the _username_ is only shown if different from the _login user_, and the _hostname_ is not shown at all. Because, both the _username_ and the _hostname_ are shown in my `tmux` status line.

The `[directory]` module uses some substitutions for `~/Documents`, `~/Downloads`, `~/Music`, `~/Movies`, `~/Pictures`, `~/Sources` (check the `starship.toml` for more information) and also replaces the default path separator (`/`) with the powerline _light right arrow_ (` ＞ `).

The `[shell]` module is meant to be only visible, if different from the standard shell. My main shell is the [Fish Shell][fish], therefore no additional information is shown. You can change that in the `[shell]` module section in the `starship.toml` file.

Currently, the modules, which are enabled, are based on my personal preferences (see the [preview](https://github.com/mickimnet/myth-prompt-themes#preview) section for more information). You can use `starship config module_name.disable false` or `starship config module_name.disable true` to change it. If you're wondering what modules are shown and why, you can always use `starship explain`.

If you don't like the symbols, I've included alternative symbols in the `starship.toml`. If you would like to have a newline before the prompt, use `starship config add_newline true`.

### Preview

The preview images are made on _macOS_ with [iTerm](iterm), and a patched [Input][input] font (to include _Nerd Font_ support and to add ligatures).

The following modules are **shown in the preview** and are **disabled** in the `starship.toml` configuration files (list is in order of appearance):
- **Memory** (seen in the _home_ directory, where the user is _root_)**:** to enable use `starship config memory_usage.disabled false`.
- **OS** (seen in the _home_ & _infra_ directories)**:** to enable use `starship config os.disabled false`.
- **Battery** (seen in the _nothings/gonna/stop/us/now_ directory)**:** is only shown if less than 20%. If you always want to show it, uncomment the section in the `starship.toml` file.
- **Time** (seen in the _nothings/gonna/stop/us/now_ directory)**:** is only shown between 8 pm and 6 am--to remind you about R&R time :sunglasses: If you always want to see it, comment the `time_range` line in the `starship.toml` file out.
- **Status** (seen in the _starbase_ directory)**:** to enable use `starship config status.disabled false`. The `[character]` module (the green pointed arrow) turns red if the shell exit code is not `0`. The `[status]` module shows additional information.
- **Git Metrics** (seen in the _elixir_ and _node_ directories)**:** to enable use `starship config git_metrics.disabled false`.
- **Shell** (seen in the _go_ directory)**:** my default shell is the [Fish Shell][fish], therefore only other shells are shown. See the `[shell]` section in `starship.toml` for further information and to change or adapt to your liking.
- **Command duration** (seen in the _python-project_ directory): to enable use `starship config cmd_duration.disabled false`.

#### M.y.t.h. Colorful Pointed:

with right prompt support (general):
![M.y.t.h. Colorful Pointed with right prompt support](https://github.com/mickimnet/myth-packages/blob/master/screenshots/myth-prompt-themes/colorful-pointed-general-starship.png)
_Remark:_ the newline in between the prompts is just used for the preview. The configuration itself doesn't use newlines (which can be enabled).

without right prompt support (left_only):
![M.y.t.h. Colorful Pointed left side only](https://github.com/mickimnet/myth-packages/blob/master/screenshots/myth-prompt-themes/colorful-pointed-left_only-starship.png)
_Remark:_ the newline in between the prompts is just used for the preview. The configuration itself doesn't use newlines (which can be enabled).

#### M.y.t.h. Colorful Slanted:

with right prompt support (general):
![M.y.t.h. Colorful Slanted:](https://github.com/mickimnet/myth-packages/blob/master/screenshots/myth-prompt-themes/colorful-slanted-general-starship.png)
_Remark:_ the newline in between the prompts is just used for the preview. The configuration itself doesn't use newlines (which can be enabled).

without right prompt support (left_only):
![M.y.t.h. Colorful Slanted:](https://github.com/mickimnet/myth-packages/blob/master/screenshots/myth-prompt-themes/colorful-slanted-left_only-starship.png)
_Remark:_ the newline in between the prompts is just used for the preview. The configuration itself doesn't use newlines (which can be enabled).

## Update history

### Version 1.0: 2023-05-01

- renamed _Dark_ to _Colorful_ in preperation for upcoming variations
- included all modules up to _Starship_ version 1.14.2
- moved all colors to the [palettes] module
- updated all symbols to reflect upcoming changes to [Nerd Fonts 3.0][nerdfonts] (the obsolete Material Design ones)
- included _right prompt_ support in the _general_ configuration (for [cmd][cmd], [elvish][elvish], [Fish Shell][fish], [nushell][nushell], [xonsh][xonsh], [zsh][zsh])
- moved the Powerline styling to the [format] module, so they can be easily adapted for left / right side variants or other powerline symbols
- styled the `VI` command modes
- styled the `continuation_prompt`
- replaced my custom shell modules with the new standard `[shell]` module
- included the shell script for module [custom.giturl]
- styled the [line_break] module so it can be optionally used

## Upcoming

- light color scheme
- new variations (with less colors)
- download link for the config files

## Thanks

Very big thank you goes out to late [@elseym][siwa] for his invaluable support and feedback all the time. :black_heart: And thank you [@tom][tom] for always making time to listen to me and for your on point feedback. :yellow_heart:

_Always have fun:sunny: in what you're doing and_ "DON'T PANIC"… :rocket:

**Enjoy!**

<!-- ------------------------------------ reference section ------------------------------------ -->

[bookquote]: https://www.goodreads.com/book/show/74297.Myth_ion_Improbable

[licence badge]: https://img.shields.io/github/license/micck/myth-prompt-themes
[licence]: <LICENSE>
[stars badge]: https://img.shields.io/github/stars/micck/myth-prompt-themes
[stargazer]: https://github.com/micck/myth-prompt-themes/stargazers
[issues badge]: https://img.shields.io/github/issues/micck/myth-prompt-themes
[issues]: https://img.shields.io/github/issues/micck/myth-prompt-themes
[paypal badge]: https://img.shields.io/badge/paypal-donate-ff69b4.svg?style=flat
[donate]: https://ZZZ.not.yet.known/

[starship]: https://starship.rs/
[powerline]: https://powerline.readthedocs.io/en/latest/
[nerdfonts]: https://www.nerdfonts.com
[firacode]: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip
[hack]: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hack.zip
[victor]: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/VictorMono.zip

[cmd]: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands
[elvish]: https://elv.sh
[fish]: https://fishshell.com
[nushell]: https://www.nushell.sh
[xonsh]: https://xon.sh
[zsh]: https://www.zsh.org

[iterm]: https://iterm2.com
[input]: https://input.djr.com

[siwa]: https://github.com/elseym
[tom]: …
