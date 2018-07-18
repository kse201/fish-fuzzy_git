function peco_git_tag
    set -l query  (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    git tag | peco --prompt "GIT TAG>" $peco_flags | head -1 | sed -e "s/^[\* \f\n\r\t]*//g" | read tag

    if [ $tag ]
        git checkout $tag
    end
end

