
# pluggable-terraform-in-ansible


# Goal:
Create an Ansible playbook to deploy terraform projects including deciding appropriate parameters to provide a good balance between usability and customizability.
(Ansible v2.5+ has released a module for Terraform which is used here.)
This playbook is intended to be run within a Jenkins pipeline.
Think about it as a generic playbook to deploy any terraform project.

The idea is to have various capabilities like:

.Ability to set backend configuration during runtime
.Ability to pass  terraform variables through Ansible vars
.Have a way to create-
.Only terraform plan and not execute it  (for example, this can be used to create a manual approval stage)
.Create the plan and execute it
.Just execute a plan that has been created earlier
.If you think the new module lacks these capabilities. Please mention them in detail.


# Usage:

# Dry Run for Playbook
`ansible-playbook -i inventories/production/hosts site.yml --check`

# Real Run for Playbook
`ansible-playbook -i inventories/production/hosts site.yml`
