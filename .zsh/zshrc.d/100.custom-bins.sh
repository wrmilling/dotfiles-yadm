if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$HOME/.yadm/darwin-bin/:$PATH"
else
  export PATH="$HOME/.yadm/linux-bin/:$PATH"
fi
