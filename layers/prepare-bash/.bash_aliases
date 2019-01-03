alias o=xdg-open

# Custom emacs bindings
REAL_EMACS=$(which emacs)

alias emacs="bash -c  'disown_emacs() { ($REAL_EMACS $@ &) }; disown_emacs'"
alias emacst="$REAL_EMACS -nw"
alias fmacs="bash -c  'disown_fmacs() { ($REAL_EMACS -q --load ~/.fmacs $@ &) }; disown_fmacs'"
alias fmacst="$REAL_EMACS -nw -q --load ~/.fmacs"
alias e="emacs"
alias et="emacst"
alias f="fmacs"
alias ft="fmacst"

