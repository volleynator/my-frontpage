#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "docker build -t my-frontpage:latest ."
            }
        }
	stage('Deploy') {
	    steps {
                sh 'docker save -o /tmp/my-frontpage.tar my-frontpage:latest'
                sh 'scp -i /var/jenkins_home/.ssh/id_rsa /tmp/my-frontpage.tar volleynator@159.69.9.37:/tmp/my-frontpage.tar'
                sh 'docker load -i /tmp/my-frontpage.tar'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 docker load -i /tmp/my-frontpage.tar'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 docker-compose -f /opt/volleynator/nginx/docker-compose.yml up -d my_frontpage'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 rm /tmp/my-frontpage.tar'
            }
        }
    }
}
