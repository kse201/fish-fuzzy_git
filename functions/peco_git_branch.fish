function peco_git_branch
    set -l query  (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    git branch -a | peco --prompt "GIT BRANCH>" $peco_flags | head -1 | sed -e "s/^[\* \f\n\r\t]*//g" | read branch

    if [ $branch ]
        echo $branch | grep 'remotes' >/dev/null 2>&1
        set remote $status
        if [ $remote = 0 ]
            git checkout -t $branch
        else
            git checkout $branch
        end
    end
end

