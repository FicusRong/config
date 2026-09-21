#!/bin/bash
input=$(cat)

used_pct=$(jq -r '.context_window.used_percentage // empty' <<< "$input")
in_tok=$(jq -r '.context_window.current_usage.input_tokens // empty' <<< "$input")
out_tok=$(jq -r '.context_window.current_usage.output_tokens // empty' <<< "$input")
five_hr=$(jq -r '.rate_limits.five_hour.used_percentage // empty' <<< "$input")
seven_day=$(jq -r '.rate_limits.seven_day.used_percentage // empty' <<< "$input")

fmt_pct() { [ -n "$1" ] && printf '%.0f%%' "$1" || echo "N/A"; }
fmt_left() { [ -n "$1" ] && printf '%.0f%%' "$(echo "100 - $1" | bc)" || echo "N/A"; }
fmt_num() { [ -n "$1" ] && echo "$1" || echo "N/A"; }

ctx=$(fmt_pct "$used_pct")
tokens="in $(fmt_num "$in_tok") / out $(fmt_num "$out_tok")"
credit="5h $(fmt_left "$five_hr") · 7d $(fmt_left "$seven_day")"

printf 'Ctx %s | Tok %s | Credit %s' "$ctx" "$tokens" "$credit"
