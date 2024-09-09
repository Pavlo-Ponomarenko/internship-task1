pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') // Use Jenkins credentials store
        DOCKER_HUB_REPO = 'ponomarenko245/scheduler' // Replace with your Docker Hub repo
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Pavlo-Ponomarenko/internship-task1'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDENTIALS}") {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
