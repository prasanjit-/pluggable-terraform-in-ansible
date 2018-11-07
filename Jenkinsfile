pipeline {
    agent any

properties([[$class: 'BuildBlockerProperty', blockLevel: <object of type hudson.plugins.buildblocker.BuildBlockerProperty.BlockLevel>, blockingJobs: '', scanQueueFor: <object of type hudson.plugins.buildblocker.BuildBlockerProperty.QueueScanScope>, useBuildBlocker: false], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '4')), disableConcurrentBuilds(), disableResume(), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], parameters([choice(choices: ['aws', 'docker', 'gce'], description: 'Name the cloud provider where you would like to deploy.', name: 'Cloud_Provider'), string(defaultValue: 'new_instance', description: 'Name of the instance you would like to launch.', name: 'Instance_Name', trim: false), choice(choices: ['present', 'absent'], description: 'Specify whether you want to add or remove the Terraform implementation.', name: 'Terraform_State')])])


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
