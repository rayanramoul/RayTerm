// UPDATE A FORK 


# Add the remote, call it "upstream":

git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote into remote-tracking branches

git fetch upstream

# Make sure that you're on your master branch:

git checkout master

# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:

git rebase upstream/master

If you don't want to rewrite the history of your master branch, (for example because other people may have cloned it) then you should replace the last command with git merge upstream/master. However, for making further pull requests that are as clean as possible, it's probably better to rebase.

If you've rebased your branch onto upstream/master you may need to force the push in order to push it to your own forked repository on GitHub. You'd do that with:

git push -f origin master



// DOING PULL REQUEST 
# Create a new branch by issuing the command:
git checkout -b new_branch

# Create a new remote for the upstream repo with the command: 
git remote add upstream https://github.com/kedark3/demo

# Once you push the changes to your repo, the Compare & pull request button will appear in GitHub.