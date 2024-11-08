# Assignment 3.12
### Learn how to run CICD pipeline to create lambda function
1. Create a **lambda function**.

2. Create github repository and clone localy.

3. Set the repository **main branch protected** and added **secrets** and **variables**.

4. Using **terraform code** to setup lambda function, **IAM** role and policy

5. Create below workflows (**yaml files**) for the github actions.
   - CI-Checkov.yml
   - CI-Terraform-Check.yml
   - CI-Terraform-Plan.yml
   - CD-Terraform-Apply.yml
   - Terraform-Destroy.yml

6. Verify the Lambda function at AWS is created and run the test with below json files.
```
   {
    "name": "Teck Choy",
    "city": "Seoul",
    "month": "December"
   }
```

![Screenshot 2024-11-08 232031](https://github.com/user-attachments/assets/756c0c1f-afc5-4c37-98e8-80e01908bb20)
