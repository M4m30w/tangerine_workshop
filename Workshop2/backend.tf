terraform {
 backend "gcs" {
   bucket  = "tangerine-terraform"
   path    = "/terraform.tfstate"
   project = "tangerine-terraform"
 }
}
