pipeline {
    agent any

    stages {
        stage('Plan') {
            steps {
                echo 'ansible-playbook site.yml -f 5 -e provider=docker -e tf_state=absent --check'
                sh 'ansible-playbook site.yml -f 5 -e provider=docker -e tf_state=absent --check'
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
