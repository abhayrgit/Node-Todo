pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'express-app'
        CONTAINER_NAME = 'express-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'your-credentials-id', url: 'https://github.com/your-username/your-repo.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 3000:3000 $DOCKER_IMAGE
                '''
            }
        }
    }
}