provider "aws" {
  alias  = "bucket_account"
  region = "eu-central-1"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  alias  = "uploader_account"
  region = "eu-central-1"
  access_key = ""
  secret_key = ""
}
