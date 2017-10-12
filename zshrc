export ZSH=/Users/mynguyen/.oh-my-zsh
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

ZSH_THEME="dracula"
# Oh-my-zsh plugins
plugins=(git)
DEFAULT_USER=mynguyen
# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'
# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
# PATH
export PATH="$HOME/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems:$HOME/.local/bin:$HOME/.cabal/bin:$GHC_DOT_APP/Contents/bin:$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:/opt/ImageMagick/lib/pkgconfig/MagickCore.pc"
export PATH="$HOME/Library/Android/sdk/platform-tools:$HOME/Library/Android/sdk/platform-tools:/Applications/VimR.app/Contents/Resources/:$HOME/Library/Python/3.6/bin:$PATH"
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Sourcing Oh-my-zsh
source $ZSH/oh-my-zsh.sh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mynguyen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mynguyen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mynguyen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mynguyen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
