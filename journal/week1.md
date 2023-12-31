# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents
- [Journal TOC and Major Version](#journal-toc-and-major-version)
- [My Texas Rangers are dropping fly balls!!! :rage:](#my-texas-rangers-are-dropping-fly-balls-----rage-)

### Journal TOC and Major Version
We are rearranging our README file and breaking it down into weeks and using a table of contents.

This website will help breakdown our big file and make a TOC easily for us:
[Automate making a TOC for your README file](https://ecotrust-canada.github.io/markdown-toc/)

###### My Texas Rangers are dropping fly balls!!! :rage:

This will be a major revision and our tag will be 1.0.0, as we are working through week1 videos.

We'll put all the work done in the Readme file so far in to Week0.md and then start on this next week's documentation in Week1.md (this file).

Made a TOC for the week0 journal and trying to find out why my picutes haven't shown up just yet. 

Create a journal folder and added/created new weekX.md files for future documentation.

Then will continue to document this work.

### Fixing my images in my journal files
They were not showing up correctly; needed to find out why and make that change.

UPDATE: The images were not pathed correctly after the move into the journal folder.
They started with "image/Filename.png" and needed to be "/images/Filename.png"
Got that fixed.  Now to need to stash my changes and move those into a new branch and 
commit.

Need to rewatch the end of one of the videos to get the git stash cmds.
Had to go back to the video for 'Terraform Cloud and Terraform Login' as that video didn't create a branch to do the work in, before doing the work.

While you're still in the "wrong" branch:
```bash

git pull
git fetch
git add .
git stash save
git checkout <NAME_OF_BRANCH (24-fixed-my-image-path-for-my-journal-files)>
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
touch terraform.tfvars
```
and move the provider info into the provider.tf file.

We have an output in main.tf; let's move that to output.tf: [TF outputs](https://developer.hashicorp.com/terraform/language/values/outputs)  


We'll define a variable in our variables.tf file: [TF Variables](https://developer.hashicorp.com/terraform/language/values/variables)

With that done, let init and see if plan :rage: at us...
and it does!
![TF Init after setting up a variable](/images/TFInitVarError.png)

That's what happens when you C/P code and don't replace variable names.  :smiling_imp:

Correct and try again!!

Looks good!![That worked!](/images/TFInitVarSuccess.png)

Now trying plan.  I've got a few things wrong and I'll work through how to correc them.  I need to put the value of the UUID in and how to pass that around.

Fix the things that need fixin'.

(I set up my TF Cloud Token to expire more than 30 days from now so I don't have to reset this up.)

So that we get a faster reply from TF plan, for the time being we'll take out the cloud config of our TF, and run locally.
We'll remove/destory our current resources in TF before we remove the cloud componet of TF. 

That was successful:
![TF Destroy before removing TF Cloud config](/images/TFDestroyb4TFCloudRemove.png) and my bucket is gone from my S3 list! 

In the video Andrew had to create ENV VAR in TF Cloud.  I have done that already trying to fix a previous issue.

We'll have to re initialize TF again:

```bash
tf init
```

but we have another small issue.  We need to remove the lock file so that TF can work,".terraform.lock.hcl" file and the .terraform folder (YES, I KNOW!! IT SCARES ME TOO!!!) and try the init again. TF should think we are local again. 

SUCCESS!  My local tf init worked!!  My tf plan worked and so did my apply.  I got the tag set up with my UUID.

![LocalTFapplywUUID](/images/LocalTFapplywUUID.png)

You can pass variables several ways and this document will show you how that is done with examples: [How to pass TF variables](https://saturncloud.io/blog/how-to-pass-variables-to-terraform-modules-via-cli-or-tfvars-file/)

I did go ahead and set up that variable, UUID in my TF Cloud proejct. 

I did go ahead and create the bucket in my AWS S3 list and at this point we are storing the lock file locally, instead of TF Cloud.  Seems in the next video we'll try an import of resources.

## Terraform Import and Configuration Drift
In the last video, we deleted the .lock.hcl file.  That means that TF doesn't know what we have built as there is no
"source of truth" to refer to.  To fix this we'll try to import the resources and let TF know of them.

Keep in mind not all resources can be imported. Fortunately, our two items can; an S3 bucket and a **random** string.

I've run a ``` tf init ``` first to get TF set up on in my env.

#### Import the **random** string
I was able to get the random string imported first, with this exact cmd:
```bash
terraform import random_string.s3_bucket_name m2g094yvm028oas0
```

![Random String-Name Imported](/images/Import-Random-string.png)

![Import-Random-string-done](/images/Import-Random-string-done.png)

#### Import the S3 bucket
We can look up the s3 bucket and see that there is a way to import that item:

[Import an S3 Bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

the format of that cmd is:
```bash
terraform import aws_s3_bucket.bucket bucket-name
```

I tried this a few times and was only successful my final time, after asking ChatGPT.

This was the cmd I used for my bucket import:
```bash
terraform import aws_s3_bucket.example m2g094yvm028oas0
```

![Import an S3 Bucket](/images/Import-S3_Bucket.png)

and the success:
![S3 Bucket Import Success](/images/S3-Bucket-Import-Success.png)

Now if you view-only the .tfstate file, you'll see the two resources that were brought in, the bucket and the random string-name

I stopped my env and the video. I lost the screen results so I coudln't take screen shots.

I ran tf apply and it did destory my bucket but did recreate it with the same name.  I see this an an issue b/c I didn't want the bucket destoryed and recreated.  Maybe I don't fully understand how import works. 
I can see this being an issue if you have a big database with lots of info.  My tf plan shows that the ransdom string will be destoryed b/c I pulled that code out of my config.  

![Alt text](/images/TFPlan-RemoveRandom.png)

When I did the ``` tf apply --auto-approve```, the random string is removed, my bucket is still there with it's same name.

![Alt text](/images/TFapply-KeepsBucket.png)

I think this is something I'd have to play with a little more for better understanding.

## Terrahouse Module

We are creating the directory structure for our modules, and we'll base that structure on hashicorp's documentation.
[TF module directory struture](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

We'll need a new folder. Under that folder, create these files:

```bash
touch main.tf
touch variables.tf
touch outputs.tf
touch LICENSE
touch README.md
```

- list items moved from top level main.tf to module/main.tf

[Info on AWS provider options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#provider-configuration)
We are leaving ours empty for the time being but you can use this section to provide credentials.

```bash
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

We've moved our ```variables.tf ``` to the module/variable.tf in its entirety. The top level variables.tf still exists but is empty.

I moved my ```outputs.tf``` file from the top level to the module folder. It no longer lives at the top level.

### Reference a Module
Now since top level main.tf is mostly empty, how do we reference the module?
[Reference a module in TF](https://developer.hashicorp.com/terraform/language/modules/sources)

We are referenceing our own (local) module. The relative path to the module is necessary. 

```bash
# https://developer.hashicorp.com/terraform/language/modules/sources

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # pass in any vars you need
  UUID           = var.UUID
  s3_bucket_name = var.s3_bucket_name
}
```
### Module variables or input

```bash
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # pass in any vars you need
  UUID           = var.UUID
  s3_bucket_name = var.s3_bucket_name
}
```

These variables have been set up in the folder's/module's ```/modules/terrahouse_aws/variables.tf```.  We'll add them to the 'call' of this module and give them values, but is called from the top level's ```main.tf``` 

### Running TF with the new structure.
Let's give it a try and see what needs to be corrected..

```bash 
tf init
tf fmt
tf plan
```

Minor issue: 
![Alt text](/images/Module-TFinitProvider.png)
We can remove the extra provider info from the child module. 
I'll comment that out....

Otherwise a good ```tf init```
![Alt text](/images/ModuleTFinit-green.png)

I always like my files to look good:

``` bash
tf fmt
```
and now run plan
``` bash
tf plan
```
Opps! An issue with my variables:

![Alt text](/images/Module_tfVariables.png)

Make sure you have a reference to the variable in your top level variables.tf file.  It can be a reduced definition.

Another issue:  

![Alt text](/images/ModuleTFvariableValues.png)
I'll have to come back to this and figure out what I did incorrectly. 

I think I corrected some issues redoing the last video that helped with some issues I was having.

### Outputs from modules
To get the output from your modules you'll have to referece them in your main/top level ```outputs.tf```

```
   output UUID {
    description = "This is the uniquie tag of our bucket"
    value = module.terrahouse_aws.UUID
}
```
to see your output

``` 
terraform output
```
![Alt text](/images/TFModuleOutput.png)

We need to make sure that we do ``` tf destroy --auto-approve``` as we are completing our lessons.

![Alt text](/images/ModuleTFDestory--auto-a.png)

Ran a ```tf show``` to make sure that my resources were removed.

![Alt text](/images/Module-TF-show.png)

My Texas Rangers won their first playoff game against the TampaBay Rays.  4-0 

###### Create Terrahouse Module video finished!

## Static Website Hosting

Tasks:
- configure s3 bucket for static webpage
- upload an index.html
- upload an error.html
- update the outputs for the static webpage url

Asking chatGPT gives us info that is outdated but guides us to what we are looking for.

We want to use TF to build a website using an s3 bucket.
Searching AWS's documentation, we get this page:
[aws_s3_bucket_website_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)

Once that has been run through plan and apply, making sure it all works up to this point, go and check in AWS/S3 to see if the bucket is enabled for static website hosting.  It is!
![Alt text](/images/StaticWebsiteOn.png)

We'll get the output for the website-end point. Check the docs to see what output matches what we want best.

Upload files to the s3 bucket, index.html and error.html
(Upload files to s3)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object]

(FileSystems and WorkSpace info)[https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info]

I was able to upload the index.html file to the bucket. I'll get the error.html uploaded as well.
![Alt text](/images/Indexhtml.png)
![Alt text](/images/IndexandErrorhtml.png)

Also let's put this filepath into a variable so that it's not hard coded and that we might be able to use this module again.  We'll use ${path.root} and append rest of the path needed.

Using an "e-tag" will help determine is a files contents have changed. I found this online: [a little about Tf and e-tags](https://www.reddit.com/r/Terraform/comments/x1m49t/help_understating_etag_option_from_aws_s3_object/)

If you change/update the index/error files, now it will let you know that something has changed.

[TF File Exists!](https://developer.hashicorp.com/terraform/language/functions/fileexists) This function will ensure that the file has been created.

I noticed that once we had the file paths in place, the top level main.tf had an error in it.  You need to make sure that you pass in the variables needed.  
I have two lines commented out, but see how there is a lot of red in this screenshot with those lines (*file_path) commented out:
![Alt text](/images/mainTFErrors.png)

Once you add the necessary variables into the top level main.tf, they go away... b/c you gave it the needed info.
![Alt text](/images/mainTFErrorsCorrected.png)

One thing I'm going to try is to remove the files from the bucket and see if they'll be uploaded again, and if any change to the text has been detected. 

Removed the files from my bucket:
![Alt text](/images/BucketEmpty.png)

2 items will be created, the index and error html files.
![Alt text](/images/2FilesToCreate.png)

I did create/copy the files to the bucket.
![Alt text](/images/2FilesUploaded.png)

Make sure to destroy your resources once you have things in place.

Bucket was removed.

![Alt text](/images/BucketRemoved.png)

## Content Delivery Network
Creating a CDN for our static s3 hosted website.
(AWS CloudFront Distribution)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution]
(AWS CloudFront OAC)[https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-cloudfront-introduces-origin-access-control-oac/]


2 new files created:  resource-cdn.tf and resource-storage.tf
Moved the bucket and files portion into the storage and now looking up how to create
a CDN for the other file.

In video Content Delivery Network @ 15:49 and going to commit and take a break.

### TF Data Sources
[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

Data Sources allow us to get info from the resources we create or from our account.
We'll use the sts get-caller-identity to output some info that we'll use.

[Data source for get-caller-identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)

[TF locals](https://developer.hashicorp.com/terraform/language/values/locals)

Had some issues with TF plan working.  I had the bucket name wrong in the bucket policy... That is the hardest part for me. I wonder around in this code and look at examples, and I get it corrected but damn it takes me so F**KING long to get there!!  :rage:

Got TF plan working and issues corrected.  Ready for TF apply -a--a

This will take a few minutes up to 15 to get deployed correctly.  

![Alt text](/images/TFApplyCDN.png)

But I did get an error...

![Alt text](/images/TFApplyCND_ErrorFileUpLoad.png)

My files didn't get uploaded.  I'll going to try the apply again...and it was successful. 
The files were created and uploaded.

![Alt text](/images/TFApplyCDN_FilesCreated.png)

The bucket was created and the files uploaded.  When we go look at CloudFront and look at the distribution name,
copy it and paste into our browser, the files are downloaded but not displayed.  This needs to be fixed.

I found an answer here: 
[Set Content Type for files uploaded to S3 in TF](https://github.com/hashicorp/terraform-provider-aws/issues/13134)

Run another 

```
tf plan 
tf apply --auto-approve
```
and let the changes take place.

TF thought the file was an application, so it was going to download it. Change it to text/html will allow it to be displayed

![Alt text](/images/FileTypeChangeforCDN.png)

BUT...
Becuased this behavior is cached, we have to set up an invalidation for this distribution.
![Alt text](/images/Invalidate.png)

![Alt text](/images/CreateInvalidation.png)

and it will work on that task:
![Alt text](/images/WorkingOnInvalidation.png)

and complete.
![Alt text](/images/ValidationComplete.png)

Still not showing, but downloading...

Do we HAVE to make a new invalidation each time?  Really? We can just "re-run" the last one?  Ugh!!!

I was still having an issue with the files downloading... I had to clear the browser cache for it
to work properly.  ChatGPT is good for a few things:
![Alt text](/images/ChatGPT_ClearBrowser.png)

Again, took too long to find a solution to get this working... ugh!! I bet I spend 15-20 mins on it.  This makes me feel like I am not learning.   Glad I got it documented. 

I wanted to see an example of where the retain on delete was being used; It helps me, to see where it is in the code and how it is used.
[TF CDN retain_on_delete](https://blakesmith.me/2016/04/02/terraform-aws-static-site-with-cloudfront.html)

Remember to
```
tf destroy --auto-approve
```
at the end of your work before you commit your branch so that you don't run up a bill of some kind.

## Terraform Data and Content Version

We will set up a content version that will update ONLY when we want it to.  We do not want TF to push an update
each time we perform a ``` tf apply --auto-approve ```

With help from ChatGPT: "write a terraform variable for content_version that only uses positive numbers starting at +1."
we get:

```tf
variable "content_version" {
  description = "Version number for your content"
  type        = number
  validation {
    condition     = var.content_version > 0
    error_message = "Content version must be a positive number starting at +1."
  }
  default     = 1
}

```

I've added this variable's definition to each level of code (module level and main level)

### Using TF Meta-Arguments for Lifecycle Resource Management

https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle

The arugment we'll use is the ignore_changes based on the etag value.
```
  lifecycle {
    ignore_changes = [ etag ]
  }
 
```

Run these commands and correct any errors. I tend to spell the terraform.tfvars file name wrong, a lot.
``` 
tf init
tf plan
tf apply --auto-approve
```

Let the resources build. It may take a few minutes. I have to run the auto apply again b/c my files don't get created the first time.
 - something I need to look into as it keeps happening.

Now we'll test this content versioning.

I'll make a change to index.html and run tf plan again.  It'll see a change that needs to be made.

```
  etag = filemd5(var.index_html_path)
  
  # lifecycle {
  #   ignore_changes = [ etag ]
  # }
```

With the code commemted out, the change is detected.
![Alt text](/images/FileChangeDetected.png)

Once we remove the comments from the code, the change is ignored.
```
  etag = filemd5(var.index_html_path)
  
  lifecycle {
    ignore_changes = [ etag ]
  }
```
![Alt text](/images/FileChangesIgnored.png)

We want the update to take place when a new version is needed.

[TF terraform_data](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

We'll use terraform_data to get some info about the content version and once that is updated, trigger the change to up load a new version of the file. (resource-storage.tf)
```t
resource "terraform_data" "content_version" {
  input = var.content_version  
}
```


```t
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [ etag ]
  }
```

TF does see the changes and will apply them,

![Alt text](/images/FileVersionUpdated-changed.png)

but this does not fix the invalidation issue we were having before.

## Invalidate Cache and Local Exec

###### My Texas Rangers Won today! The broadcast team on Fox/FS1 was horrible and not impartial at all!! 

I am house/cat sitting while trying to complete my work. I didn't know that I am very allergic to ragweed, which has blown in, in the city I'm house sitting. I don't know how those of you who suffer with several allergies like this work through your day. I'm worn out, tried/sleepy from the medincine I have to take to make my nose quit running and my eyes not cry.

We'll ask ChatGPT how to invalidate files in a CloudFront distribution using a null_resource. (Using terraform_data is an more updated way.)

Here's what it found:
```
resource "null_resource" "cloudfront_invalidation" {
  triggers = {
    distribution_id = aws_cloudfront_distribution.example.id
  }

  provisioner "local-exec" {
    command = <<-EOT
      aws cloudfront create-invalidation \
        --distribution-id "${self.triggers.distribution_id}" \
        --paths "/*"
    EOT
  }

  depends_on = [aws_cloudfront_distribution.example]
}

```
[Terraform null resource](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)

We'll use the local-exec funtion to run an AWS CLI command line to execute the file invalidation.

[More info on AWS CFront Invalidation as a cmd line](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html)

```
aws cloudfront create-invalidation --distribution-id distribution_ID --paths "/*"
```

We'll put this code in so that we can invalidate files that need to be changed/updated and that they'll actually show the correct version we intend. 

Make sure to copy the variables to the .tfvars file and perform a 
```
tf init
```
to see if we have any errors. 
My set up will probably make me run tf apply twice b/c the bucket never seems to be in place when I need to upload the files.

A new output variable has been made to make it easier for us to get the CF Distribution, instead of having to into the console to get it.
```t
output "cloudfront_url" {
  
}
```

I've updated my index.html file with a small update, updated the content_version in the .tfvars file, and ran an apply.

I've noticed that both my files will be changed/updated.  I'm sure it is b/c I have the invalidation code in both files.  I may take it out of the error file resource.

Run the apply.  See that there are changes to be applied, and what they are.
My invalidation is working.  

## Assets Upload and For Each

First, I'll upload two pics for my index.html file.  A logo for my baseball team, now in the post-season, and a pic of my tiny house on wheels b/c that's what I live in and I hope to base my house on for terratowns. 

With those uploaded, we'll install a simple http server, found here [Simple NPM http server](https://www.npmjs.com/package/http-server) and add it to the gitpod.yml file to install each time we boot up our env.

I've uploaded and put image links into my index.html page. 
I'm going to push up my work so far and go to bed.
Stopped at 7:52 in video Assets Upload and For Each

- 10/09/23

We'll use TF console to help us figure out how to get a list of file from the /public/assets folder and iterate through them to upload them to the s3 bucket.

[TF for_each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

- I corrected the issue of needing to copy the .tfvars file manually each time, before I could run ``` tf init ```.  Now I need to find a way to delay a resource so that I don't have to run TF apply a second time to get my index/error files uploaded.

When I asked ChatGPT for "I want to upload a list of files to an s3 bucket, using terraform for_each, please give me an example", I got this example:

```t
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "files_to_upload" {
  description = "List of files to upload to the S3 bucket"
  type        = list(string)
}

resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name
  acl    = "private" # You can set the ACL as needed
}

resource "aws_s3_bucket_object" "file_upload" {
  for_each = { for idx, file in var.files_to_upload : idx => file }

  bucket       = aws_s3_bucket.example.id
  key          = each.key
  source       = each.value
  content_type = "application/octet-stream" # Set the appropriate content type
}
```

We'll try a few things using [TF Console](https://developer.hashicorp.com/terraform/cli/commands/console)

``` 
tf console
```

[TF Fileset function](https://developer.hashicorp.com/terraform/language/functions/fileset)

To find the files in a particular path I used:
```
fileset(path.module, "public/assets/*")
```
This isn't quite the same as used by Andrew, and I wanted to play around a little. I did use the path.module to show/start at the root of my filesystem.

```
fileset(path.module, "public/assets/*.{jpg,gif,png}")
```
allows us to find files that end in jpg, gif, and png.

now we'll put those filenames in a list, using [TF List](https://developer.hashicorp.com/terraform/language/functions/list)

I could NOT figure out why I couldn't see my images once I had moved them from their public folder into an assets folder!  I was giving it too many paths to follow. I just needed to reference the one folder up from where the file actually lived. That drove me batty for most of this afternoon! 
I finally got my files to upload to the assets folder, and can see the images from the webserver and the CDN.

Fumbled through the for_each as well. I may try to do this lesson again. 

I went ahead and watched the rest of the video where a variable was created for the assets_file_path.  Once I got that in place, I was able to get pass the issues I was having with my image/asset/uploads not working correctly.

Do make sure to do a ``` tf destory --auto-approve ``` before you end your environment.

I have finally reached the point that I can submit my homework for week 1.

An issue I found and resolved from looking at the Discord channels...
[issue with week1 validator](https://discord.com/channels/1138488133558730883/1159893246391091211)

Now I'm going to go back and see if I can make a new branch and get it updated and merged.