
#!/bin/bash

# Define the auto-completion function for Zsh
COMPLETION_TEXT="compdef _list_script_completion ~/hyprdots/scripts/lists/main.sh"

# File to check (Zsh uses ~/.zshrc)
ZSH_FILE=~/.zshrc  

# Check if the file contains the completion function
if ! grep -qF "$COMPLETION_TEXT" "$ZSH_FILE"; then
    echo "Adding auto-completion to $ZSH_FILE..."

    cat >> "$ZSH_FILE" <<EOF

# Auto-completion for your script in Zsh
_list_script_completion() {
    local cur=\${words[CURRENT]}
    local prev=\${words[CURRENT-1]}
    local -a opts lists

    opts=("create" "read" "add" "delete" "lists")
    lists=(\$(ls ~/lists 2>/dev/null | sed 's/\.txt\$//'))

    case "\$prev" in
        create|delete|read|add)
            compadd -W "" -a lists
            ;;
        *)
            compadd -W "" -a opts
            ;;
    esac
}

$COMPLETION_TEXT
EOF

    echo "Auto-completion added. Reloading Zsh configuration..."
    source "$ZSH_FILE"
else
    echo "Auto-completion already exists in $ZSH_FILE."
fi
