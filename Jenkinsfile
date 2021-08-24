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
        stage ('Pull code to Slave'){
            agent {
                label 'testserver'
            }
	    steps {
                echo 'Git checkout Started....'
                checkout scm
                echo 'Git checkout Done....'
           }
	}
        stage('Docker Build') {
	    agent {
                label 'testserver'
            }
	    steps{
                echo 'Docker Build Started....'
	 	script {
	            sh 'sudo docker build -t rahmathulla/proj1:${BUILD_NUMBER} .'
                }	
                echo 'Docker Build Done....'
            }
        }
        stage('Container Deployemnet on testserver') {
            agent {
                label 'testserver'
            }
            steps{
                echo 'Started container deployment....'
                script {
                    sh 'sudo docker stop phpApp'
                    sh 'sudo docker run -itd -p 9001:80 --name phpApp rahmathulla/proj1:${BUILD_NUMBER}'
                }
                echo 'Container Running....'
            }
        }

    }
}
