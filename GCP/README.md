# Setting Up GCP Authentication

1. Install and configure the Google Cloud SDK on your local machine by following the instructions provided in the official documentation: [Google Cloud SDK Installation Guide](https://cloud.google.com/sdk/docs/install).

2. Open a terminal or command prompt on your local machine and initialize the Cloud SDK by running the following command:

```bash
gcloud init
```

3. Set up the default login that will be used when running Terraform by executing the following command:

```bash
gcloud auth application-default login
```

# Running Terraform

0. To run Terraform, first create a project in GPC and a bucket in Google Cloud Storage as a backend. You also have to link the project to a billing account prior to creating a storage bucket. Use the following commands in Google SDK Shell to accomplish this:

(Optional)
```bash
gcloud projects create <YOUR_PROJECT_NAME>
```

1. Set the project and the billing to it.

```bash 
gcloud config set project <YOUR_PROJECT_NAME>
gcloud billing projects link <YOUR_PROJECT_NAME> --billing-account=<YOUR_BILLING_ACCT_ID>
gcloud storage buckets create gs://<YOUR_PROJECT_NAME>-tfstate --public-access-prevention --uniform-bucket-level-access
```

2. Navigate to the "stage" directory using the command line:

```bash
cd <PATH>
```

3. Initialize Terraform by executing the following command:

```bash
terraform init
```

4. Before applying any changes, verify the resources that will be created by running the following command:

```bash
terraform plan
```

5. Apply the Terraform changes by executing the following command:

```bash
terraform apply
```

# Others:

## Cloud Storage Param.

You can find more parameters on [terraform-resourse-storage-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket).
