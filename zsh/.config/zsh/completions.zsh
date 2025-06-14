# completion.zsh

# Skip compaudit (faster startup)
ZSH_DISABLE_COMPFIX=true

# ✅ 1) Define where the dump goes
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
mkdir -p "${ZSH_COMPDUMP%/*}"

# ✅ 2) Pre-setup completion paths (optional but robust)
# Ensure system completions in fpath early:
fpath=("/usr/local/share/zsh/site-functions" "/usr/share/zsh/site-functions" $fpath)

# ✅ 3) Run compinit *AND* source existing dump to register compdefs
autoload -Uz compinit

# Init completion
if [[ -r "$ZSH_COMPDUMP" ]]; then
  source "$ZSH_COMPDUMP"
else
  compinit -C  # -C: don’t check dump age
fi

# Enable caching of completions
# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path ~/.zcompcache
