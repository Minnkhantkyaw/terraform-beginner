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

Next we'll move the exectuables from the terratown/bin directory to our main bin directory.  This way the .exec are all in the same general folder.

Make sure that those files are executable as well.  Use 
```bash
chmod 
```
to make the changes.
```bash
cd bin/terratowns
chmod u+x *
```
![Alt text](/images/bin-tt-chmod.png)

Once done, stop the current evn and restart it; check to make sure that all is working well. 

All seems to be good with the changes in env that have been implemented
- sinatra
![Alt text](/images/sinatra-server.png)

### [Sinatra](https://sinatrarb.com/)
Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

### [Bundler](https://bundler.io/guides/sinatra.html)

 Sinatra uses Blunder to install packages, like node uses npm.

 #### Terratown Mock Server
 Using Sinatra/Bundler and exectuing the files @ 21:41 in video Terratowns Mock Web Server

 The Rangers game is about to start and we're going to kill the Orioles and advance to the ALCS. 

 10/11/23
 I sped throug the rest of this video to see what it entailed and it confuses me.  I'm not exactly sure
 what we are doing or why. I will go back to my last stopping point and go back over
 the material. 

 In our file ``` server.rb ```
 We are going to make our server behave like a database; it'll keep the state
 of our global variable with this server.

  ActiveModel is part of Ruby on Rails.
  it is used as an ORM. It has a module within
  ActiveModel that provides validations.
  The production Terratowns server is rails and uses
  very similar and in most cases identical validation
  https://guides.rubyonrails.org/active_model_basics.html
  https://guides.rubyonrails.org/active_record_validations.html

  create some virtual attributes to stored on this object
  This will set a getter and setter
  eg. 
  home = new Home()
  home.town = 'hello' # setter
  home.town() # getter

https://terratowns.cloud/

With the changes made to the server.rb file we'll need to stop and restart the server.

```sh
Crtl-c 
bundle exec ruby server.rb
```
![Alt text](/images/RestartingSinatra.png)

Then we'll run the create script:
```bash
./bin/terratowns/create
```
and we'll get this as a positive/no-error result:

![Alt text](/images/tt-create.png)

create returns a uuid 
and in the Sinatra window for the server:

![Alt text](/images/Sinatra-Create-Result.png)

Next, we'll try a read of the Terratown database; make sure to give it a UUID as an input.

```bash
./bin/terratowns/read aef90082-9824-4d1a-9359-2f1fb12148ef
```

![Read Terratowns](/images/Sinatra-Read.png)

Now update:

```bash 
./bin/terratowns/update <uuid>
```
![Alt text](/images/Sinatra-Update-TT.png)

and delete the house
```bash
./bin/terratowns/delete <uuid>
```
![Alt text](/images/Sinatra-Delete-TT.png)

## Setup Skeleton For Custom Terraform Provider
Working through this video. I though I had to be moved back to TF cloud.  I tried to get myself prepped
for that but messed something up.  I had enabled that code, but then took it out/commented it out.  
I tried to run TF local again but was getting an error...  I went ahead and renamed the .tfstate file
and it allowed me to run tf locallly again.
On to the next segment.

This task is to create a custom TF provider for our project.  It'll be built in *Go*.

We'll create a new folder and a new file under that folder create a new file for the Go program, named ``` main.go ```

```bash 
mkdir terraform-provider-terratowns 
cd terraform-provider-terratowns 
touch main.go
```

I copied the file from Andrew's repo and will walk through the video as it goes along.  I'm not sure I fully understand and I'm not familiar with Go.

Once we get a good amount of code in the file (I didn't write a bit of Go code, it belong to Andrew!!) we'll find a way to compile the code.

A ``` .terrafromrc ``` file will be needed in this process. 

```bash
touch .terraformrc
```
and copied the contents of Andrew's file.


Also need to create this file ``` build_provider.sh```

```bash
cd /bin
touch build_provider.sh
```
and copied the contents of Andrew's file.

When trying to complie the go file, we'll run into some issues.  We'll need a ``` go.mod ``` file.

```bash
cd terraform-provider-terratowns
touch go.mod
```
Commands I ran to get my Go program to compile.
![Alt text](/images/BuildingGo.png)

But I am not seeing the complied file...

Found my error.  I had an ``` / ``` in the cmd to compile where it wasn't needed.  Now I am seeing the same results as in the video.

```bash 
 go build -o terraform-provider-terratowns_v1.0.0
```
I removed the folder it created. 

Added some new files to my .gitignore.

```yml
# Ignore CLI configuration files
.terraformrc
terraform.rc

terraform-provider-terratowns/terraform-provider-terratowns_v*
```

## Resource Skeleton

I had a merge conflict in my last branch.  I reached out to the discord channel and got a suggestion 
from @bayko!  I wasnt' really sure what I needed to do.  I took a chance to follow some instrcutions that
GitHub suggested, made my edits and was able to get my branch merged up.  I made a new one for the next
video (57-resource-skeleton) and all seems to be working well for the time being.

I am on the correct branch and I will be pushing my work up more frequently.
I hope I remember this when I have to do this in the real world... 
These were the steps I followed after I read up on @Bayko's advice.

![Alt text](/images/GitMergeConflictInstructions.png)

I was able to run the ``` build_provider.sh ``` script and to ru ``` tf init ``` and ``` tf plan ```

On the the Resource Skeleton video!!!

We'll open the ``` main.go ``` file.

Following along.  I think I have all of this code from a previous branch.
I'm not having to update anything at this time.

### CRUD

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete


## Implementing CRUD

More following along b/c I don't know Go.

I got the same results as the video.  I can create, update and delete a house.

## Deploying to Terratowns

I'm ready to try to deploy to TerraTowns. :smile:

I signed up with the TerraTowns.cloud site and I have my info.  I'll up date my ``` main.tf ``` with that info.  I'll not show it here due to wanting to keep that info safe.

I built my provider, I ran 
```bash
tf init
tf plan
tf apply --auto-approve
```

Ran into some errors.  I made sure that my code was correct, but the fix was that I needed to change my domain to something different and my endpoint was misspelled.  

```t
resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023! - SM"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz23.cloudfront.net"
  town = "missingo"
  content_version = 1
}
```

I am now able to see my house in missingo in terratowns.cloud. :astonished:

Now to destroy the house.  That completed successfully!!

Update the code with our real info:

Followed the video and I am getting my bucket created, the CloudFront distribution working;
it took about 8-9 minutes and I thought that I had some infinite loop that I didn't know
how to get out of! 

Now I'm destorying the house and I'll make some adjustments to the house/name/town I want it to be in.


## Terraform Cloud and Multi Home Refactor

Made changes to my code to work in TF Cloud again.  You can make this change for all your projects in your TF Cloud account or you can set them for a particular project/workspace. That is the option I have choosen, per the video.

I've updated my ``` gitpod.yml ``` to run the build_provider script each time a new env starts up.
This allow me to skip that step in my set up each time.


Not sure that is working for me as my deploy is taking about 8-9 minutes.
it is working, just take a bit of time for it to complete. :smile:

I'm making two houses.  One is for my own, existing Tiny House on Wheels, named [Morton Manor Tiny House on Wheels](http://www.mortonmanor.net/)
And the other is for another fictional tiny house that I'd love to build, named Columbia Cottage.

We'll need to refactor a few things.

You can use the module again, it just needs to be called something different.
Call the "house" module, but give it a different name.
Like using a cookie cutter; you use the tool (module) to cut the cookie out the sugar cookie dough (morton manor),
then you use the tool (module) cut another cookie from a shortbread dough (columbia cottage). 
Same tool, different cookies. 
Now to give those module the info it needs to build those different houses. 

MortonManor->house
ColumbiaCottage->house

Got all my names lined up and working. I can build the provider, I can 
```t
tf init
tf plan 
tf apply --auto-approve
```
but my files are not showing up as they should.  I think I found the issue.
My index.html files had a path that may have been incorrect. 

It was my index.html file that was incorrect.  I have it fixed, my images are showing up,
and when I change the text and update the content version I get a change.

I can delete the first house (Morton Manor Tiny House) and it will recreate!

Now I will try to add a second house!

I had to correct a variable in the new house...

and I had to run ``` tf init ``` again.

My plan is good, no errors and 10 resources to create.

I am not getting an assets folder uploaded to my 2nd bucket for my 2nd house
(columbia cottage)  
I *think* the issue is that the image file name had a .JPG as
an extension.  I've renamed it .jpg (lowercase) to see if that will 
work.

After fixing the extension in the asset folder and ALSO in the html file...
I'm going to re-run my tf apply... 
Then I'll try the changing of the text, version number, and deleteing the house...

So far, I'm in good shape.  My two houses have created, I can see the pictures for each.

Now I'll try to delete one and see if it recreates.  It did before.
Columbia Cottage has been removed,and TF did see that it needs to recreate it...

It did recreate the Columbia Cottage.

Now I'm changing some of the text for the page and updating the content version to 4.
Before:
![Alt text](/images/CC_BeforeTextChange.png)

and the changes were noticed and updated.

![Alt text](/images/CC_AfterTextChange.png)