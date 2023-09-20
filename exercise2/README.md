## Implemented solution

1. Create a bucket  
2. Set expiration 180 days  
    with lifecycle rule  
3. Best practices  
    Set Versioning  
4. Security  
    Set Encryption  
    Set ACL to private  
    Block public access  
5. Cost reduction  
    No KMS key used for encryption  
    Set Infrequent Access after 7 days  
6. Use different account  
    Create uploader user with uploader account  
    Create IAM backup_uploader role  
    Create IAM Policy for upload to bucket  
    Assign IAM policy to the backup_uploader role  
7. Set up backup_uploader role  
    Create bucket policy (allow upload for the backup_uploader role)  
