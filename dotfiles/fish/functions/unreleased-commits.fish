function unreleased-commits;
        set latest (git describe --abbrev=0)
        echo "Latest tag is $latest"
        git log --oneline --no-decorate (git describe --abbrev=0)..HEAD;
end
