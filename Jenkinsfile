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
                sh 'scp -i /var/jenkins_home/.ssh/id_rsa /tmp/volleynator-website.tar volleynator@159.69.9.37:/tmp/volleynator-website.tar'
                sh 'docker load -i /tmp/my-frontpage.tar'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 docker load -i /tmp/volleynator-website.tar'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 docker-compose -f /opt/volleynator/nginx/docker-compose.yml up -d volleynator_de_website'
                sh 'ssh -i /var/jenkins_home/.ssh/id_rsa volleynator@159.69.9.37 rm /tmp/volleynator-website.tar'
            }
        }
    }
}
