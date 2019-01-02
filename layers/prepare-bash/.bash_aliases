alias o=xdg-open

# Custom emacs bindings
REAL_EMACS=$(which emacs)
disown_emacs() { ($REAL_EMACS $@ &) }
disown_fmacs() { ($REAL_EMACS -q --load ~/.fmacs $@ &) }
alias emacs="disown_emacs"
alias emacst="$REAL_EMACS -nw"
alias fmacs="disown_fmacs"
alias fmacst="$REAL_EMACS -nw -q --load ~/.fmacs"
alias e="emacs"
alias et="emacst"
alias f="fmacs"
alias ft="fmacst"

btc() {
  BTC_VALUE=$(curl -s https://api.cryptonator.com/api/ticker/BTC-USD | jq .ticker.price | sed 's/"//g')
  printf "%.2f\n" $BTC_VALUE  
}
