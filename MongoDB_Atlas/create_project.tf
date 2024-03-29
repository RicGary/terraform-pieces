provider "mongodbatlas" {
  public_key = var.name
  private_key  = var.password
}

variable "project_id" {
  type        = string
  default     = "65aeb31fd86ae2623b263d8b"
}
variable "cluster_name" {
  type        = string
  default     = "SteamWishlist"
  description = "Desired cluster name"
}
variable "cluster_size" {
  type        = string
  default     = "M0"
}
variable "region" {
  type        = string
  default     = "SA-EAST-1"
}

resource "mongodbatlas_cluster" "cluster" {
  project_id   = var.project_id // Your mongodb atlas project id
  name         = var.cluster_name // Desired cluster name
  disk_size_gb = 0.5 // Disk size: Choose based on the instance size flavour you want. For ex, for M10, it's 10GB
  num_shards   = 1

  replication_factor           = 3
  provider_backup_enabled      = false
  auto_scaling_disk_gb_enabled = false
  mongo_db_major_version = "4.2"

  //Provider Settings "block"
  provider_name               = "GCP" // Could be GCP | AWS | AZURE
  provider_disk_iops          = 100
  provider_volume_type        = "STANDARD"
  provider_encrypt_ebs_volume = true
  provider_instance_size_name = var.cluster_size // Could be anything above M2. M0 is not supported via this provider
  provider_region_name        = var.region // Desired region
}