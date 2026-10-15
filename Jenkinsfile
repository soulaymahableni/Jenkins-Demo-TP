pipeline {
    agent any

    tools {
        maven 'maven-3.5.2'
      jdk   'JDK'

    }

    environment {
        DOCKER_HOST = "tcp://localhost:2375"
        IMAGE_TAG   = "devopsexample:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/soulaymahableni/Jenkins-Demo-TP.git'
            }
        }

        stage('Build Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_TAG .'
            }
        }

        stage('Deploy Docker Image') {
            steps {
                sh '''
                    docker stop devopsexample || true
                    docker rm devopsexample || true
                    docker run --name devopsexample -d -p 2222:2222 $IMAGE_TAG
                '''
            }
        }
    }
}
