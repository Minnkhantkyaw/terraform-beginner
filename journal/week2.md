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