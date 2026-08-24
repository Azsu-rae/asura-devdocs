
You can view Git commit history using several commands depending on how much detail you want.

### View all commits

```bash
git log
```

Shows:

- Commit hash
- Author
- Date
- Commit message

### Compact one-line history

```bash
git log --oneline
```

Example:

```text
f3a9b2d Fix login bug
8c7d1a4 Add user authentication
4b5c6d7 Initial commit
```

### Show commit history as a graph

```bash
git log --oneline --graph --decorate --all
```

This displays branches and merges in a tree-like format.

### Show the last _n_ commits

```bash
git log -n 5
```

Shows only the last 5 commits.

### View commits affecting a specific file

```bash
git log path/to/file
```

### Show detailed changes in each commit

```bash
git log -p
```

This includes the diff for every commit.

### Show a specific commit

```bash
git show <commit-hash>
```

Example:

```bash
git show f3a9b2d
```

### Quick reference

|Command|Description|
|---|---|
|`git log`|Full commit history|
|`git log --oneline`|One-line summary of commits|
|`git log --graph --oneline --all`|Graphical branch history|
|`git log -n 10`|Last 10 commits|
|`git log --author="Alice"`|Commits by a specific author|
|`git log --since="2 weeks ago"`|Recent commits|
|`git show <commit-hash>`|Details of a specific commit|

For day-to-day work, the most commonly used command is:

```bash
git log --oneline --graph --decorate
```

It provides a concise and easy-to-read view of your repository's history.


There are several ways to undo the last commit, depending on what you want to happen to the changes.

### Keep the changes staged (most common)

If you want to undo the commit but keep all the changes ready to recommit:

```bash
git reset --soft HEAD~1
```

Result:

- ✅ Last commit is removed.
    
- ✅ Changes remain staged (`git add` is not needed again).
    

---

### Keep the changes, but unstage them

If you want to undo the commit and put the changes back into your working directory:

```bash
git reset HEAD~1
```

or explicitly:

```bash
git reset --mixed HEAD~1
```

Result:

- ✅ Last commit is removed.
    
- ✅ Changes remain in your files.
    
- ❌ Changes are no longer staged.
    

---

### Discard the commit and all its changes

If you want to completely erase the last commit **and** all the changes it introduced:

```bash
git reset --hard HEAD~1
```

⚠️ This permanently deletes those uncommitted changes from your working tree. Only use it if you're sure you don't need them.

---

### If you've already pushed the commit

If the commit has already been pushed to a shared remote, it's usually safer to create a new commit that reverses it:

```bash
git revert HEAD
```

This preserves the project's history and avoids rewriting commits that others may have based work on.

If you really need to remove the pushed commit from history, you can reset locally and then force-push:

```bash
git reset --hard HEAD~1
git push --force-with-lease
```

`--force-with-lease` is safer than `--force` because it checks that you won't overwrite someone else's recent work.

---

**Which situation are you in?**

- The commit is **only local**.
    
- The commit has been **pushed to GitHub/GitLab**.
    
- You want to **keep the changes** or **delete them completely**.


# IN-PROGRESS WORK

You can safely turn your current work into a WIP branch **without losing anything**.

### 1. Create a branch from your current state

You're currently on `main` with all those modifications:

```bash
git switch -c wip/current-work
```

That's it.

Your working tree stays exactly as it is. Git doesn't require you to commit before switching to a newly created branch.

Now:

```bash
git status
```

will say:

```text
On branch wip/current-work
```

with all your modifications still there.

### 2. Commit your WIP work

Since you're switching machines, I'd commit everything:

```bash
git add .
git commit -m "WIP: current development"
```

Then push the branch:

```bash
git push -u origin wip/current-work
```

Now your unfinished work is safely on the remote.

---

### 3. On the other machine

Clone/pull the repository, then:

```bash
git fetch
git switch wip/current-work
```

You'll get the WIP commit and can continue working.

Make more commits whenever you want:

```bash
git add .
git commit -m "WIP: continue ORM refactor"
git push
```

You don't need to worry about making these commits beautiful.

---

### 4. When the whole thing actually works

You have two choices.

**Option A — preserve all your development commits:**

```bash
git switch main
git pull
git merge wip/current-work
git push
```

**Option B — make `main` clean, with one commit for the whole feature:**

This is probably closer to what you're describing.

You can squash the branch when merging:

```bash
git switch main
git pull
git merge --squash wip/current-work
git commit -m "Implement ORM refactor"
git push
```

Then your history looks roughly like:

```text
main:

A ── B ── C ── Implement ORM refactor
```

while your WIP branch might have:

```text
A ── B ── WIP ── WIP ── fix ── WIP ── WIP
```

That's a perfectly good workflow.

**For your exact situation right now, I'd do:**

```bash
git switch -c wip/current-work
git add .
git commit -m "WIP: current development"
git push -u origin wip/current-work
```

Your `main` itself remains untouched and clean.