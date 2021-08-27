pipeline {
    agent any
  
    stages {
        stage('Clone') { 
            steps {
                git branch: 'main', url: 'https://github.com/SiwatINC/nginx-pagespeed-mariadb-java'
            }
        } 
        stage('Build Docker Image') {
            steps {
                script {
                    image = docker.build("siwatinc/nginx-pagespeed-mariadb-java:latest")
                }
            }
        }
        stage('Publish Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://ghcr.io/v2") {
                        image.push()
                    }
                }
            }
        }
    }
}