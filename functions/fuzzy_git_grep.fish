function fuzzy_git_grep
    set -l query $argv

    git grep --line-number "$query" | fzf --prompt "GIT GREP> " --query "$query " | head -1 | read select_line

    if [ $select_line ]
        set select_file (echo $select_line | awk -F':' '{print $1}')
        set select_number (echo $select_line | awk -F':' '{print $2}')

    switch $EDITOR
        case nvim vim vi
                eval "$EDITOR +$select_number $select_file"
        case '*'
                eval "$EDITOR $select_file"
        end
    end
end
