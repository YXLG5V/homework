# Home Test from Chemaxon

## Exercise 1

  

Create a terraform module that does the following:

  

- Deploys a VPC with internet access<br/>

- 4 subnets across 2 AZs<br/>

    - 2 Public subnets, designed to host a load balancer or reverse proxy <br/>

        - Can communicate directly with the internet<br/>

    -	2 private designed to host application servers <br/>

        - Internet access for outbound connections.<br/>

- Ensure that calls to the S3 API from within the VPC does not leave the AWS backbone network for security and cost reduction.<br/>

- Create an example where you use the module.<br/>


## Exercise 2

  

We have an application that stores data on a filesystem, and our backup policy requires that it stores backups for 180 days and no more. You have selected S3 as the backup storage in a different account.

Your goal is to ensure these backups are stored according to best practices. Please implement an S3 bucket with the appropriate configuration you think of as best practices for this task. Recommended ways to approach the problem are security, cost considerations.

Actually uploading the files as a cron job or something is not part of this exercise, but you have to ensure that the following IAM role is able to upload files into the bucket arn:aws:iam::123456789012:role/backup_uploader (its a fake :)).
