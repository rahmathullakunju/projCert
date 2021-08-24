pipeline {
    agent any

    stages {
        stage('Install Puppet Agent') {
            steps {
                echo 'Start to install puppet agent....'
		ansiblePlaybook become: true, credentialsId: '86ef8ad7-51f2-48ee-8d6e-257ad6f9bd79', disableHostKeyChecking: true, installation: 'MyAnsible', inventory: 'puppet.inv', playbook: 'playbook-puppet.yml'
                echo 'Done install puppet agent....'
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
