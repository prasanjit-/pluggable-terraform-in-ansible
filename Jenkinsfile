pipeline {
    agent any

    parameters {
          choice(
              name: 'Cloud_Provider',
              choices: "aws\ndocker\ngce",
              description: 'Name the cloud provider where you would like to deploy.')

          string(
              name: 'Instance_Name',
              defaultValue: 'foo_instance',
              description: 'Name of the instance you would like to launch.',
              trim: 'false')

          choice(
              name: 'Terraform_State',
              choices: "present\nabsent",
              description: 'Specify whether you want to add or remove the Terraform implementation.')
        }


    stages {
        stage('Terraform Plan') {
            steps {

                sh 'ansible-playbook site.yml -f 5 -e provider=${Cloud_Provider} -e tf_state=${Terraform_State} -e instance_name=${Instance_Name} --check'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
