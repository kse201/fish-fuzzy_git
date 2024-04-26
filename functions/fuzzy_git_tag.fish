function fuzzy_git_tag
    set -l query  (commandline)
    if test -n $query
        set query --query "$query"
    end

    git tag | fzf --prompt "GIT TAG> " $query | head -1 | sed -e "s/^[\* \f\n\r\t]*//g" | read tag

    if [ $tag ]
        git checkout $tag
    end
end
