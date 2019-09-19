#!/usr/bin/env ruby

# This script setups aliases for git which I rather like
system "git config --global user.name \"Winston R. Milling\""
system "git config --global user.email \"Winston@Milli.ng\""

graph_format = %q{--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'}

aliases = [
  'st status',
  'di diff',
  'co checkout',
  'cm commit',
  'br branch',
  'sta stash',
  'llog "log --date=local"',
  'flog "log --pretty=fuller --decorate"',
  "lg \"log --graph #{graph_format} --abbrev-commit --date=relative\"",
  'lol "log --graph --decorate --oneline"',
  'lola "log --graph --decorate --oneline --all"',
  'blog "log origin/master... --left-right"',
  'ds "diff --staged"',
  'fixup "commit --fixup"',
  'squash "commit --squash"',
  'unstage "reset HEAD"',
  'rum "rebase master@{u}"',
  'pom "push origin master"',
  'poh "push origin HEAD"',
  'bt "bug termui"'
]

aliases.each do |full_alias|
  abbreviation = full_alias.split[0]
  system "git config --global alias.#{abbreviation} > /dev/null"
  puts $? == 0 ? "#{abbreviation} exists." : "creating #{abbreviation}."
  system "git config --global alias.#{full_alias}" unless $? == 0
end
