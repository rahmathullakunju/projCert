pipeline {
    agent any

    stages {
        stage('Install Puppet Agent') {
            steps {
                echo 'Start to install puppet agent....'
		ansiblePlaybook become: true, credentialsId: 'testserver', disableHostKeyChecking: true, installation: 'MyAnsible', inventory: 'puppet.inv', playbook: 'playbook-puppet.yml'
                echo 'Done install puppet agent....'
            	}
        }
        stage('Install Docker on testserver') {
            steps {
                echo 'Start to install Docker....'
		ansiblePlaybook become: true, credentialsId: 'testserver', disableHostKeyChecking: true, installation: 'MyAnsible', inventory: 'puppet.inv', playbook: 'docker-playbook.yml'
                echo 'Done install Docker....'
            }
        }
        stage ('Git Checkout in testserver'){
            agent {
                label 'testserver'
            }
	    steps {
                echo 'Git checkout Started....'
                checkout scm
                echo 'Git checkout Done....'
           }
	}
        stage('Docker Build on testserver') {
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
		    def inspectExitCode = sh script: "docker ps -f name=phpApp", returnStatus: true
		    if (inspectExitCode == 0) {
    			sh 'sudo docker stop phpApp'
		    }
                    sh 'sudo docker rm  phpApp'
                    sh 'sudo docker run -itd -p 9001:80 --name phpApp rahmathulla/proj1:${BUILD_NUMBER}'
                }
                echo 'Container Running....'
            }
	    post {
             failure {
                script {
                  echo 'Started container stopping after fail....'
                    sh 'sudo docker stop phpApp'
                    sh 'sudo docker rm  phpApp'
                  echo 'container stopped after fail....'
		}
             }
            }

        }

    }
}
