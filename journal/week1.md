# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents
- [Journal TOC and Major Version](#journal-toc-and-major-version)
- [My Texas Rangers are dropping fly balls!!! :angry:](#my-texas-rangers-are-dropping-fly-balls-----angry-)

### Journal TOC and Major Version
We are rearranging our README file and breaking it down into weeks and using a table of contents.

This website will help breakdown our big file and make a TOC easily for us:
[Automate making a TOC for your README file](https://ecotrust-canada.github.io/markdown-toc/)

###### My Texas Rangers are dropping fly balls!!! :angry:

This will be a major revision and our tag will be 1.0.0, as we are working through week1 videos.

We'll put all the work done in the Readme file in to Week0.md and then start on this next week's documentation in Week1.md (this file).

Made a TOC for the week0 journal and trying to find out why my picutes haven't shown up just yet. 

Create a journal folder and added/created new weekX.md files for future documentation.

Then will continue to document this work.

### Fixing my images in my journal files
They were not showing up correctly; needed to find out why and make that change.
The images were not pathed correctly after the move into the journal folder.
They started with "image/Filename.png" and needed to be "/images/Filename.png"
Got that fixed.  Now to need to stash my changes and move those into a new branch and 
commit.

Need to rewatch the end of one of the videos to get the git stash cmds.
Had to go back to the video for 'Terraform Cloud and Terraform Login'
as that video didn't create a branch to do the work before doing the work.

```bash
git pull
git fetch
git add .
git stash save
git checkout 24-fixed-my-image-path-for-my-journal-files
git stash apply
```
Then inside gitpod go ahead an commit the changes and proceed as you would if you'd created
the branch before making the changes.

## Restructure Root Module

We'll format our file structure according to HashiCorp documentation.
Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # This is where we'll define our variables.
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # providers and their configuration
├── outputs.tf              # Keeps the values for the variable so we can use the elsewhere
└── README.md               # Gives you the info about the module, configuration options and more.
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

Here are some common Terraform Files.  
![Common Terraform Files](/images/commonTFfiles.jpg)
I got this off LinkedIn from [John Berth](https://www.linkedin.com/in/john-breth-730b7755/)


We'll create some missing files:

```bash
touch providers.tf
touch outputs.tf
touch variables.tf
```
and move the provider info into the provider.tf file.

We have an output in main.tf; let's move that to output.tf