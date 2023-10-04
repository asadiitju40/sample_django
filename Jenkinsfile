pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github-credentials')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from GitHub
                script {
                    def scmVars = checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/asadiitju40/sample_django.git', credentialsId: GITHUB_CREDENTIALS.id]]])
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Build Docker image
                script {
                    def dockerImage = docker.build("asadiitju/sample_django:${env.BUILD_NUMBER}", "-f Dockerfile .")
                }

                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
    }
}
