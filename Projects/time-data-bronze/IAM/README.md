## IAM
This folder is responsible for handling all the access related terraform scripts. It contains 3 files name
- custom_roles.tf
- service_accounts.tf
- user_policies.tf

### custom_roles
    This file is responsible for creation of the custom IAM roles

### service_accounts
    This file is responsible for just the creation of the Google service accounts. The permission of these service accounts is still handled in user_policies/

### user_policies
    This file is responsible for the user and service account accesses for all GCP services
