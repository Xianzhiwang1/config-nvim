export CLICOLOR=1
PROMPT="%F{0}%n %1~ %# %f"
export LSCOLORS=gxfxcxdxbxegedabagacad

# To create a venv
alias cenv="python -m venv .venv"

# make font colorized
# Activate a venv
alias activate="source .venv/bin/activate"

# Add venv as ipython kernel
function add-kernel () {
	ipython kernel install --name "$1" --user
}
autoload -Uz compinit && compinit

setopt +o nomatch  # for cleanup
eval "$(pyenv init -)"

alias math="cd ~/Desktop/Topology/homeworks"
alias cs="cd ~/Desktop/Computer-Architecture/assignments"
alias z=zathura
alias tex-snippets="mvim ~/.vim/UltiSnips/tex.snippets"
export NVIM_CONFIG="~/.config/nvim/init.vim"
# For smooth scrolling
export NEOVIDE_MULTIGRID=1
alias nv=neovide
# For vim on the cmd line
bindkey -v
# also for different cursors... not sure how it works just took this from so
export VI_MODE_SET_CURSOR=true

# add path to neovide executable
PATH="/Users/stevenjinxuan/Applications/neovide/target/release:$PATH"; export PATH

alias dig="java -jar /Applications/Digital.jar"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stevenjinxuan/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stevenjinxuan/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stevenjinxuan/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stevenjinxuan/Applications/google-cloud-sdk/completion.zsh.inc'; fi
eval OPAM_SWITCH_PREFIX='/Users/stevenjinxuan/.opam/4.11.1'; export OPAM_SWITCH_PREFIX;
CAML_LD_LIBRARY_PATH='/Users/stevenjinxuan/.opam/4.11.1/lib/stublibs:/Users/stevenjinxuan/.opam/4.11.1/lib/ocaml/stublibs:/Users/stevenjinxuan/.opam/4.11.1/lib/ocaml'; export CAML_LD_LIBRARY_PATH;
OCAML_TOPLEVEL_PATH='/Users/stevenjinxuan/.opam/4.11.1/lib/toplevel'; export OCAML_TOPLEVEL_PATH;
PATH="/Users/stevenjinxuan/.opam/4.11.1/bin:/Users/stevenjinxuan/Applications/google-cloud-sdk/bin:/usr/local/opt/openjdk/bin:/Users/stevenjinxuan/.pyenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:$PATH"; export PATH;

PATH="/Users/stevenjinxuan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/stevenjinxuan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/stevenjinxuan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/stevenjinxuan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/stevenjinxuan/perl5"; export PERL_MM_OPT;

# Add texlab to path
PATH="/Users/stevenjinxuan/Applications/texlab/target/release:$PATH"; export PATH

# Rust configs
source $HOME/.cargo/env

# neovim paths
export NVIM_CONFIG=/Users/stevenjinxuan/.config/nvim
export NVIM_DATA=/Users/stevenjinxuan/.local/share/nvim

alias nvc="cd $NVIM_CONFIG"
alias nvd="cd $NVIM_DATA"
