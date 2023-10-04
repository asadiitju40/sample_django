pipeline{
    agent any
    // check the connectivity with github
    stages{
        stage("Github Checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-credentials', url: 'https://github.com/asadiitju40/sample_django']])
            }
            post{
                success{
                    echo "========Checked out successfully========"
                }
                failure{
                    echo "========Checkout failed========"
                }
            }
        }
                // building images
        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    def dockerImage = docker.build("asadiitju/sample_django:${BUILD_NUMBER}", "-f Dockerfile .")
                }
            }
            post{
                success{
                    echo "========Build Docker Image successfully========"
                }
                failure{
                    echo "========Build Docker Image failed========"
                }
            }            
        }
    }
}
