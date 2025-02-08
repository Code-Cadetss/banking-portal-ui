# Banking Portal UI


## Features

- User Registration: Users can register by providing their details, such as name, email, address, and phone number.
- PIN Management: Users can create and update their PINs for added security.
- Cash Deposit and Withdrawal: Users can deposit and withdraw cash from their accounts.
- Fund Transfer: Users can transfer funds to other accounts within the system.
- Transaction History: Users can view their transaction history.


## Deployment steps to OCP

1. We have added Dockerfile please take the latest source code.

2. Replace API endpoint with your banking api deployed in OCP
   filapath: **src/environment/environment.ts** and **src/environment/environment.prod.ts**

3. Connect to your OCP cluster either via Web OC CLI or local OC CLI using **copy login command** from right top drop down.
4. Once connected navigate to the project space:
   Run below command :

   ```oc new-app <YOUR_GIT_URL> --name=ocphackathon-ui```

   This command will create you buildConfig.yaml, deploymeny.yaml and servive.yaml

   **buildconfig.yaml:** Builds an image from the source code (Git, Dockerfile, binary).
   
   **deployment.yaml:** Deploys the built image as a running container in OpenShift.
   
   **service.yaml:** Exposes the deployment inside OpenShift as a network service.

5. Build will get fail due to memory issue.
   Add below code in **buildconfig.yaml** under resources tab
```
   limits:
   
      memory: 2Gi
   
    requests:
   
      memory: 2Gi
```

6. Start build
