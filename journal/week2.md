# Terraform Beginner Bootcamp 2023 - Week 2

## Week 2 Live Stream

- I'm not sure if I MUST go throught this video. I will take a look through a few of the
next ones b/c something isn't making sense for me. If I can just view this video and
move past it w/o issues, I may just do that.

- https://discord.com/channels/1138488133558730883/1138488134003335201/1160936576143081472
I'm going to skip this video - it makes me lost and it seems its not necessary, really. 
Guess I'll find out.


Starting this video and following along.

Start up your GitPod env in the main branch. Usually, we open an issue, create a branch and open an env with that branch.
This is a little different procuedure.

We checkout a particual tag (1.5.0) with this command
```git checkout 1.5.0
```
![Alt text](/images/gitcheckout150.png)

Next we'll create a *new* branch using this as our basis.

```
git checkout -b <nameOfNewBranch>
```
This command will create a new branch *and* switch to it in one command.
```
git checkout -b terraform-cloud
```
and we see the prompt, below:

![Alt text](/images/gitCheckout-b.png)

In ``` providers.tf ```, we'll move back to using TF Cloud by removing the comments for

## Setting Up Terratowns Mock Web Server

I AM A GIT GODESS!  
Thank to this course, I was able to bring in my changes from a different branch to this one
and **do it correctly!**

I used ChatGPT to ask: 
``` 
What git command do I need to run to bring in every thing from main to my current working branch?
```
I followed these instructions:
![Alt text](/images/GitMerge1.png)
![Alt text](/images/GitMerge2.png)

Since I am just so inexperienced using git, this was a win for me! 

We'll clone the repo from
into our own repo. 
Use HTTPS instead of ssh due to we don't have an established fingerprint set up.

``` git clone https://github.com/ExamProCo/terratowns_mock_server.git ```

![Alt text](/images/GitCloneTerratowns.png)

Then we'll remove some files:
We need to cd into the tt's directory and remove the .git folder.
It's important that its the correct .git folder.

```bash
cd terratowns_mock_server
ls -al
rm -rf .git
```

![Alt text](/images/rm%20-rf%20git%20dir1.png)
and its been removed:
![Alt text](/images/rm-rf%20git%20dir2.png)

Now, we'll take the contents of the gitpod.yml file at the level and move it into our top level .yml file.  We'll also make sure that we are in the correct directory for this to execute.

```yaml
- name: sinatra
    before: | 
      cd terratowns_mock_server
      bundle install 
      bundle exec ruby server.rb
```
Commit the work/files done so far so we don't lose anything.
