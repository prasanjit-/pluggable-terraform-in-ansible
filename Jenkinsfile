pipeline {
    agent any

    stages {
        stage('Plan') {
            steps {
                echo 'ansible-playbook site.yml -f 5 -e provider=aws -e tf_state=absent --check'
                sh 'whoami ; which terraform ; which ansible'
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
