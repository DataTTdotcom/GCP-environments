## Datastream

Automation of the Datastream environment setup.
The automation consists of the following setups.

- Proxy server setup.

- Ingress firewall rule setup.

- Datastream private connectivity configuration.

- Datastream connection profile setup.

### Proxy server setup 
This to for the creation of the proxy compute instance that transfers the traffic from the Datastream to the actual database.

### Ingress firewall rule setup
This is for creating a firewall ingress rule to allow the datastream private connection to access the proxy server

### Datastream private connectivity configuration
This is for creation of private connectivity configuration to access the proxy server

### Datastream connection profile setup
This connection profile is used to fetch the data from the source system through the private connectivity configuration with the database credentials. This uses GCP secret manager as well. Make sure the database secret is stored in the below format.
[environment]-[system]-[component]-[purpose]-[credential_type]




For Detailed setup guidelines please visit : https://tfsb.atlassian.net/wiki/spaces/DATA/pages/318341209/Datastream+setup+-+Private+connectivity

