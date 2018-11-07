pipeline {
    agent any

    parameters {
          choice(
              name: 'Cloud_Provider',
              choices: "aws\ndocker\ngce",
              description: 'Name the cloud provider where you would like to deploy.')

          string(
              name: 'Instance_Name',
              defaultValue: 'foo-instance',
              description: 'Name of the instance you would like to launch.',
              trim: 'false')

          choice(
              name: 'Terraform_State',
              choices: "absent\npresent",
              description: 'Specify whether you want to APPLY or DESTROY the Terraform implementation.')
        }


    stages {
        stage('Terraform Plan') {
            steps {
                echo 'Excecuting Terraform Plan..'
                sh 'ansible-playbook site.yml -i inventory/hosts -f 5 -e provider=${Cloud_Provider} -e tf_state=${Terraform_State} -e instance_name=${Instance_Name} --check'
            }
        }
        stage('User Approval') {

            steps {

              script {
                        env.TERRAFORM_APPLY = input message: 'User input required',
                            parameters: [choice(name: 'Apply Terraform?', choices: 'no\nyes', description: 'Choose "yes" if you want to apply this plan')]
                      }
            }
        }
        stage('Terraform Apply') {
          when {
            environment name: 'TERRAFORM_APPLY', value: 'yes'
            }
            steps {
                echo 'Excecuting Terraform Apply..'
                sh 'ansible-playbook site.yml -i inventory/hosts -f 5 -e provider=${Cloud_Provider} -e tf_state=${Terraform_State} -e instance_name=${Instance_Name}'


            }
        }
    }
}
