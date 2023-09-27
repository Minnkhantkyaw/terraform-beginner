# Terraform Beginner Bootcamp 2023
##### This is all of my documentation up to this point. 09/26/23

## Table of Contents- [Terraform Beginner Bootcamp 2023](#terraform-beginner-bootcamp-2023)
  * [Table of Contents](#table-of-contents)
  * [GitHub Markdown for README](#github-markdown-for-readme)
    + [References](#references)
    + [Checkboxes](#checkboxes)
    + [Tables and emoji's](#tables-and-emoji-s)
  * [Branching Tagging PR :smiling_imp:](#branching-tagging-pr--smiling-imp-)
    + [Creating a pull request](#creating-a-pull-request)
  * [Installing TerraForm](#installing-terraform)
  * [Environment Variables](#environment-variables)
      - [**My Texas Ranger are winning their game right now.**](#--my-texas-ranger-are-winning-their-game-right-now--)
      - [Updating GitPod.yml file](#updating-gitpodyml-file)
  * [Installing the AWS CLI](#installing-the-aws-cli)
  * [Terraform and creating a random name string to be used for an AWS Bucket.](#terraform-and-creating-a-random-name-string-to-be-used-for-an-aws-bucket)
      - [Using the TF random provier and creating a random name-string](#using-the-tf-random-provier-and-creating-a-random-name-string)
  * [Creating the S3 Bucket using TF](#creating-the-s3-bucket-using-tf)
  * [Working with Terraform Cloud](#working-with-terraform-cloud)
    + [Migrate your TF State file off of your local machine](#migrate-your-tf-state-file-off-of-your-local-machine)
          + [(I'm not entirely clear on how each 'space' is significant.  I'll have to go back and watch the video again as I didn't document it the first time through. I noticed that an issue/branch wasn't created in the video and I wanted to do that before continuing, so I started the video again after completeing those steps.)](#-i-m-not-entirely-clear-on-how-each--space--is-significant--i-ll-have-to-go-back-and-watch-the-video-again-as-i-didn-t-document-it-the-first-time-through-i-noticed-that-an-issue-branch-wasn-t-created-in-the-video-and-i-wanted-to-do-that-before-continuing--so-i-started-the-video-again-after-completeing-those-steps-)
    + [Terraform Cloud Token Script](#terraform-cloud-token-script)
    + [Success!!!](#success---)
    + [Setting up an alias for Terraform](#setting-up-an-alias-for-terraform)
          + [(ls ~/.bash_profile) I know that `~` means home directory. I think I wasn't putting the correct characters in the right place. I had to re-learn this and find a way for my brain to keep that info.](#-ls---bash-profile--i-know-that-----means-home-directory-i-think-i-wasn-t-putting-the-correct-characters-in-the-right-place-i-had-to-re-learn-this-and-find-a-way-for-my-brain-to-keep-that-info)
      - [Bash script to load up our .bash_profile so we can have those alises each time](#bash-script-to-load-up-our-bash-profile-so-we-can-have-those-alises-each-time)


## GitHub Markdown for README
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

```
Code Block - uses triple back ticks '```' 
```

```python
print("Hello, World!")
```

add a image  (this seems to only work, for me, when using github to edit the file, not from the gitpod env.)

```! [Delicate at night] (https://github.com/shanmorton-bootcamp/terraform-beginner-bootcamp-2023/assets/125090413/e10c3715-0083-42a5-aa57-249400aeb16a)
! [] ()
```

![Delicate at night](https://github.com/shanmorton-bootcamp/terraform-beginner-bootcamp-2023/assets/125090413/e10c3715-0083-42a5-aa57-249400aeb16a)

Using a '>' will quote a line of text as below:

>Can use an HTML img to size up or down the image 

### References
relative references:

 format:  [] ()

- https://www.portland.gov/sites/default/files/code/110-sd-zone_1.pdf

- [PDX houseing codes] (https://www.portland.gov/sites/default/files/code/110-sd-zone_1.pdf)

### Checkboxes

This is the markup to use checkboxes
```
- [x] step 1
- [ ] step 2
- [x]  step 3 :tada:
- [ ] step 4
```

- [x] step 1
- [ ] step 2
- [x]  step 3 :tada:
- [ ] step 4


### Tables and emoji's
https://gist.github.com/rxaviers/7360908

```
| Name | Icon | Image |
| --- | --- | --- |
| Smiley | `:smiley:` | :smiley: |
```
| Name | Icon | Image |
| --- | --- | --- |
| Smiley | `:smiley:` | :smiley: |




## Branching Tagging PR :smiling_imp:
Now going through the video for Branching and Tagging

I knew you could create, checkout, and move to a new branch in one command,
but I like to perform those tasks seprately, as I'm still new and unsure.

Now I am setting the upstream command to push to the branch; something that always has to be done each time you create a new branch.

Check this screenshot:

![Alt text](images/GitBranching1.png)

I was able to push to the branch and set the upstream branch (branch I'll push to)


Pulled from (semver.org) [https://semver.org/]

Given a version number MAJOR.MINOR.PATCH, increment the:

- MAJOR version when you make incompatible API changes
- MINOR version when you add functionality in a backward compatible manner
- PATCH version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

To creat the tag for a branch the cmd is
git tag M.m.P   
Below is the tag I used for my branch   

```
git tag 0.1.0
```
Then push the tags to the branch:
```
git push --tags
```

See the results:
![Alt text](images/GitBranching2.png)

Following the video, we created a new branch from the issue. 

Then merged the 1_semantic_versioning branch with the newer, longer named branch with
this command:
```
git merge 1_semantic_versioning
```

This is the visual result:
![Alt text](images/GitBranching3.png)


Then pushed that up to the newest branch: 1-add-semantic-versioning-documentation-to-project
This merged the work I'd done in 1_semantic_versioning branch to this new one.

Tagged the newest branch with 
``` 
git tag 0.1.1
git push --tags
```

### Creating a pull request

Back in Github, from the main page of your repo there is a **pull requests** button:
![Alt text](images/GitBranching7.png)

Click on the new pull request button. Then you'll choose which branch you want to move into the main branch. Choose from the dropdown and look at the arrow; you'll be putting the feature branch work into the main branch 
![Alt text](images/GitBranching8.png) 

Create the pull request:
![Alt text](images/GitBranching9.png)

Choose the merge option you want; we'll be using the squash and merge
![Alt text](images/GitBranching4.png)

confirm the S&M

![Alt text](images/GitBranching5.png)

and when successful you'll get this mesg and can remove the branch, if you want.
![Alt text](images/GitBranching6.png)
We'll **not** be removing old branches as they are required, to allow a look back for grading.

Andrew showed us how to close properly the gitpod env's.  I used to left my old one open but
did find that I ran out of time and had env's left over that needed to removed.

Now that I know how to close these properly...will be making sure that I push all
my code and close my gitpod env. 

![Alt text](images/CloseGitPodEnv.png)


How to find what verison of a Linux OS I am runnging:

``` 
cat /etc/os-release
```

![Alt text](images/OS_Info.png)




```bash
git pull origin main
```  
to bring in the code form the main branch

Created a new folder bin and a new bash script install_TF_CLI.sh
to run this script 
```bash
source ./bin/install_TF_CLI.sh
```

make sure to change the file permission to make it executable

```bash
chmod u+x ./bin/install_TF_CLI.sh
```

## Installing TerraForm

Updated the instructions for installing the TF CLI.  There are better, more dettailed instruction on the link below:

- (HashiCorp instructions on installing TF for Unbuntu)[https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli]

Created a new script to install the TF CLI.  Needed to make sure that the bash script was done correctly by
including the #! for the script.  We are using bash shell.

- (Shebang info for bash scripts)[https://en.wikipedia.org/wiki/Shebang_(Unix)]

```
#!/usr/bin/env bash
```
- Allows portability in most distributions.
- Searches the PATH for the executable.

Needed to ensure that the bash script would run inside the gitpod.yml file
- (Changing the permissions to execute a bash script) [https://en.wikipedia.org/wiki/Chmod]

NOTE: we have to use 'source' to make the file run. [./bin/isntall_TF_CLI.sh] (bin/install_TF_CLI.sh)


(Use 'before' instead of 'init' in the gitpod.yml file) 
- [https://www.gitpod.io/docs/configure/workspaces/tasks]

Using 'before' is for customize the terminal or install global project dependencies.  When you restart your gitpod env it ensures that you have the items/cli you need to do the work.

## Environment Variables
Setting up EnvVar's to be referenced in our bash scirpts
Create a new branch and start up your gitpod env.
My new branch name is 4-projectrootenvvar; a super great name if I say so myself!! 
I was able to rename my branch.

The standard naming convention is  ALLUPPER_CASE_WITH_UNDERSCORES
using an '=' sign to set the variable value
and usually a *string* value.

#### **My Texas Ranger are winning their game right now.**

```bash
git fetch origin
git checkout 4-projectrootenvvar
```

To see the currently set env var's  type  'env' in the bash window

```bash
env
```
Looks like this:
![Env_cmd](images/Env_cmd.png)

To filter on some text while looking for env var use  grep, like this

```bash
env | grep GITPOD 
```
and you'll see this:

![Env Filter on 'GITPOD'](images/EnvGitPod.png)

To see the value of a particular env var

```bash
echo $THEIA_WORKSPACE_ROOT
```
![Use Echo to print the value of the env var](images/EchoEnvVarValue.png)

To unset an evn var use

```bash
unset VARIABLE_NAME
```
no $ is needed.


#### Updating GitPod.yml file
We'll up date our gitpod.yml file to make sure we are in the correct directory first, then make sure that we move back to our project directory.  This will make sure that we don't download and/or commit files that may not be needed, to our repo.

In our install TF script, we'll set a variable locally 
named PROJECT_ROOT that is set to /workspace/terraform-beginner-bootcamp-2023

```bash
PROJECT_ROOT = '/workspace/terraform-beginner-bootcamp-2023'
```

## Installing the AWS CLI

NOTE:  make sure that you use the fill name of your bash script in your .yml file. :unamused:  Don't forget the .sh 

(AWS's instructions on installing the CLI)[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]

We'll install the AWS CLI using a bash script. We are installing on a linux machine using the X86 (not ARM).

At this point,we've not set any AWS creditials.  To show that is hasn't been done yet, run:

```bash
aws sts get-caller-identity
```
This is the response you should see:

![Alt text](images/sts_getcaller.png)

We'll set these values using ENV VARs (gp env)

(How to set the AWS CLI Env Vars)[https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html]

These are the cmds I ran:
![Alt text](/images/SetAWSEnvs.png)

And run the sts cmd again to see (truncated info):

![Alt text](/images/SetCreds.png)

You'll see better, filled out info after setting those ENV vars, like this:

This info is faked for security
```json
{
    "UserId": "AIDAVUXTXXXX57URKYYYY",
    "Account": "@@@@3090####",
    "Arn": "arn:aws:iam::@@@@3090####:user/BootcampAdmin"
}
```
Do make sure that you've made this script exectuable with the chmod cmd

```bash
chmod u+x <FileName.sh>
```

Also updated the aws install script to remove the .zip file and the /aws directory so that we don't have to answer how to deal with the replacement of the fingerprint file.


## Terraform and creating a random name string to be used for an AWS Bucket.

The first website we'll need to be familiar with for this part of the bootcamp is [Terraform.io](https://www.terraform.io/)


This will have most if not all the info we'll need to work with TF.

We'll be using a provider for AWS as that's the cloud platform we'll be using.  You can find the registry here: [Terraform Registry](https://registry.terraform.io/browse/providers)

Terraform also provides templates called moduals.  So you don't have to build some things your self, youh hu can use moduals to do some of the work. [Terraform Modulas](https://registry.terraform.io/browse/modules)


#### Using the TF random provier and creating a random name-string

We'll use the HashiCorp provider for Random, found here:
[Random Provider by HashiCorp](https://registry.terraform.io/providers/hashicorp/random/latest)

Keep in mind that AWS doesn't like you to use special characters in bucket names; follow the rules for making bucket names.

We'll need to get the output of the random generated bucket name.
This is where I found an example of how to get the output from a created resource. [Example of an Output in TF](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs)


After setting up our main.tf file to use the random provider, and setting up the randomizer to give us a random string,
and a way to output that info, we'll run a initial on TF

```terraform
terraform init
```

I always like to run the formatter to make sure my files look good:
```terraform
terraform fmt
```
The next step is to run a plan command. This will generally let us know if there is an issue with our TF files.  It doesn't catch everything but you can't proceed unless 'plan' is happy.
```terraform
terraform plan
```
The output will give you information on what needs to be updated, or changed, or any issues you may have.

At this time we have no issues so we can apply this plan and see what we get as a result.  NOTE: you can automate the apply approval with the flag   '--auto-approve'.

```terraform
terraform apply --auto-approve
```

When it all is correct you'll see a happy result, like the one below:

![Terraform Apply](images/TFapply.png)

To see the outputs from your TF apply use this command:

```terraform
terraform output
```

In this case, we see the name of the bucket that will be created, from the last screen shot. :smile:

There are several files that TF produces that should not be pushed up to GitHub.  
Anything in the .terraform folder and never the TF.ftstate files or back up.
If you don't have those configured in your .gitignore you could be pushing sensative data that could be used against you or to run up your bill, or create/destroy resources that you aren't aware of.  Do be careful  Can look online for templates to use for .gitignore files.  I found this one.  This may be the very same one that this project copied from template. :shrug:

[TF .gitignore file templates](https://github.com/github/gitignore/blob/main/Terraform.gitignore)

Conversly, one of the files you SHOULD commit to github is the ./terraform.lock.hcl file. 
Read more here: [TF state lock file](https://developer.hashicorp.com/terraform/language/files/dependency-lock)

## Creating the S3 Bucket using TF

I am a little behind in my videos.
I have been obsessed with my Texas Rangers winning their games and moving to the post season. :smile:

![The Texas Rangers are at the top of the AL West](images/TXRangersStandings0924.png)

I have my AWS credentials in my set up, so when I run 

```bash
aws sts get-caller-identity
```
they are shown on the screen.

You can also check your list of S3 buckets with this command
```bash
aws s3 ls
```
If you have any buckets they'll be listed.  If none, I think the prompt just returns.
Hey AWS!  You could return a mesg like "You have no buckets created in your account." 

We'll take a look at the AWS TF provider here:
[AWS Terraform provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

Here is the documentation for AWS S3, or at least a starting point:
[AWS S3 info](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)

and here is the naming restrictions for S3 Buckets:
[Naming your S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)

Want to comment out multiple lines at one time, like Andrew does?
> Way to Comment Out Multiple Lines in Visual Studio Code
> To comment out multiple lines in Visual Studio Code, you can use the shortcut Ctrl + / (Windows/Linux) or Command + / > (Mac). Select the lines you want to comment on, then press the shortcut to comment on them. Press the shortcut again > > to uncomment the lines.

```
highlight multiple lines and press
control + / to put #'s in front of them all.
```
[Work smarter not harder](https://www.simplilearn.com/tutorials/python-tutorial/what-is-a-multiline-comment#:~:text=Way%20to%20Comment%20Out%20Multiple,again%20to%20uncomment%20the%20lines.)

Since we know that our past TF code is working, go ahead the run the init and apply with auto approve at
this time

```bash
terraform init
terraform apply --auto-approve
```
We'll see the random name being output.

We'll paste the provider info we found from the TF AWS Provider page
[](https://registry.terraform.io/providers/hashicorp/aws/latest)

It could be an exam question that you can't have two of the same providers in your .tf file.
You'll get an error;  It could look something like this:
![Too Many AWS Providers](images/TooManyProviders.png)

We you try to run TF plan again, you'll get a different error:

![Provider needs to by updated]](images/UpdateProvider.png)

Just run TF init again:

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

You'll see that the provider has been updated/added and you'll get green on your init command.
![Run TF init to update the provider info](images/TFinitUpdate.png)

Yep, we run into yet another error:  What could it be?

![Bucket naming error](images/BucketNamedWrong.png)

This will also show that your code can be "correct" and not have any errors, but still won't
produce the result you want.

I looked at the random documentation to see what I needed to change to make sure that my bucket name was all lower
case letter and numbers.  I kept running the plan but kept seeing the wrong case in my generated bucket name.
I took the chance and went ahead and ran the apply... It did give me the correct case and I'll go look
at my AWS account to see if it did get made...

It did!

![Bucket Created](images/NewBucketwRandomName.png)

An issue that may come up is that Bucket names need to start and end with a letter. I may look into 
adding a prefix and suffix to my bucket names, but I'm sleep right now.

Now to remove that bucket, run the destory command:

```bash
terraform destroy 
```
or 
```bash
terraform destroy --auto-approve
```

![Alt text](images/BucketDestroy.png)

Now my bucket will be gone; it'll take a little bit of time for the name to disappear from the list b/c
it's replicated to a few different places; it won't be gone immedately.

## Working with Terraform Cloud
On today's episode of Terraform Beginner BootCamp with Andrew Brown...

We'll get started with Terraform Cloud, get logged in and create a project/workspace for our bootcamp work.

Since the last video, we got TF to create a bucket with a random name.  We did a destroy which cleared out the resources we built.  We are re-creating them using these commands: (Do make sure you spell the cmds correctly!!!  :smile:)

```bash
terraform init
terraform fmt
terraform plan
terraform apply --auto-approve
```

![Terraform cmds](images/TF_Cmds.png)

### Migrate your TF State file off of your local machine

In TF Cloud, we gotten logged in and made the project space and the workspace. 

###### (I'm not entirely clear on how each 'space' is significant.  I'll have to go back and watch the video again as I didn't document it the first time through. I noticed that an issue/branch wasn't created in the video and I wanted to do that before continuing, so I started the video again after completeing those steps.)

After createing the workspace for our TerraTowns TerraHouse, we get a block of code to use and instructions.
![Cmds for getting our state into TF Cloud](images/TFCloudForTTTH.png)

```bash
terraform init
```

Uh oh!  Ran into an error!  We need to auth to TF Cloud!  See the error for help!
![TF Cloud Error when running TF init again](images/TFCloudErrorLogin.png)

```bash
terraform login
```
![Alt text](images/TFCloudLogin.png)

I said "yes" and pressed the P - Print option to get here:

![Alt text](images/TFCloudLicense-P.png)


I was able to open a new page and get to this:

![Alt text](images/TFCloudToken1.png)

![Alt text](images/TFCloudCredComplete.png)

Then I ran TF init again:
![Alt text](images/TFCloudInitAgain.png)

to get GREEN from my command:
![Alt text](images/TFCloudInitComplete.png)

and run TF Apply:
![Alt text](images/TFCloudApply.png)

To get an error I can work with!! Yea!!!!

The Rangers game started so I got distracted.  I am trying to work through my errors and look up 
what others are doing/have done, in Discord.

I may have fumbled my way through this.  I created a TF Cloud Env Var set and used this page to find what I needed:
[Terraform Cloud Token ](https://app.terraform.io/app/settings/tokens?source=terraform-login)

I created a variable sets in TF Cloud with the same info of my AWS ENVs.
Re-ran the TF init, plan and apply cmds and I am not getting any glaring errors.

When I look at my TF Cloud...
![Alt text](images/TFCloudRunSuccess.png)

It seems happy and green.  I don't know if I should run a tf destroy to see what would happen...

I'm going to commit my work for now (#14).

### Terraform Cloud Token Script

I'm following along with the video to automate with a bash script setting up the TF Cloud token so I don't have to go through the process each time.  

I've created a new token in TF Cloud that will last a little longer than the 30 days suggested.  I've got the gitpod env variable created.

```bash
gp env TERRAFORM_CLOUD_TOKEN='ABCEFEGHIJKLMNOPQRSTUVWXYZFAKEINFO'
```
I've made the new bash script executable:

```bash
chmod u+x generate_tfrc_creds.sh
```
and will try to run this file now. :metal:

![Alt text](images/TFCloudCredFileCreated.png)

### Success!!!

Now to update your gitpod.yml file to include this script

```yml
  - name: terraform
    before: |
      source ./bin/install_TF_CLI.sh
      source ./bin/generate_tfrc_credentials.sh
```
My TF cmds worked and the TF Cloud page says it was run 2 mins ago and is GREEN!
![Alt text](images/TFCloudNewCredsRun.png)

This task is now automated!


### Setting up an alias for Terraform 

Walking through the video to set up an alias for the Terraform command.  We'll use 'tf' as a shortcut for terraform.

I've made my branch and I've got my gitpod env open.

I for some reason am having trouble opening files like ./bash_profile in the wrong directory, creating new
files that I don't want.  So... I went looking around in a different bash shell window to find it, and MAKE SURE that
I was doing the correct work.

###### (ls ~/.bash_profile) I know that `~` means home directory. I think I wasn't putting the correct characters in the right place. I had to re-learn this and find a way for my brain to keep that info.

For my own notes the .bash_profile file is in /home/gitpod/.bash_profile.  I like to use vi, and I'll open the file with that.
![Open .bash_profile with vi command](images/OpenBashProfilew_vicmd.png)

That is done and we see the contents of the .bash_profile
![Open the .bash_profile with vi](images/OpenBashProfile.png)

Now to make my edits.
I've entered the alias for tf but I will also see if I can add another for ls.
I like to see ALL the files in a particular listed way with 'ls -al'  If I get too annoyed with it...
I can change it.

[How to make an alias in .bash_profile](https://www.shell-tips.com/bash/alias/#gsc.tab=0)

Used 'cat to see the file w/o opening it.
```bash
cat /home/gitpod/.bash_profile
```
![Alt text](images/catBashProfile.png)

Don't go bash-ing any cats.

Now the aliases won't work unless you reload .bash_profile, with this command:

```bash
source /home/gitpod/.bash_profile
```
![Run source cmd to reload profile](images/SourceBashProfile.png)

Success!  When you type 'tf' in your shell, you'll get the main menu for terraform.

![Typing 'tf' to for 'terraform'](images/TFAliasWorks.png)

#### Bash script to load up our .bash_profile so we can have those alises each time

Created a new bash script to add the alias to the ~./bash_profile and reload it: set_tf_alias.sh
Mine is adding these alias each time. I have that problem to correct.

Now to push my changes up, create the pull request, merge, and tag.  :smile: