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
        stage('Install Docker on Slave') {
            steps {
                echo 'Start to install Docker....'
		ansiblePlaybook become: true, credentialsId: '86ef8ad7-51f2-48ee-8d6e-257ad6f9bd79', disableHostKeyChecking: true, installation: 'MyAnsible', inventory: 'puppet.inv', playbook: 'docker-playbook.yml'
                echo 'Done install Docker....'
            }
        }
        stage('Docker Build') {
	    agent {
                label 'testserver'
            }
            steps {
                echo 'Git checkout Started....'
		checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahmathullakunju/projCert.git']]])
                echo 'Git checkout Done....'
                echo 'Docker Build Started....'
	 	script {
	            sh 'sudo docker build -t rahmathulla/proj1:${BUILD_NUMBER} .'
                }	
                echo 'Docker Build Done....'
            }
        }
    }
}
