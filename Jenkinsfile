pipeline {
    agent any

    stages {
        stage('Plan') {
            steps {
                sh 'ansible-playbook site.yml -f 5 -e provider=aws -e tf_state=absent -e instance_name=ansible-invoked'
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
