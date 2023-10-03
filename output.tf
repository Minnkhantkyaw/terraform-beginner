#main/output.terraform 

output s3_bucket_name {
    description = "This is the name of our bucket that will host our website"
    value = module.terrahouse_aws.s3_bucket_name
}

output UUID {
    description = "This is the uniquie tag of our bucket"
    value = module.terrahouse_aws.UUID
}