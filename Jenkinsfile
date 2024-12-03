pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'dckr_pat_SUMt_tk6LqCkNTeNbbRl4LUj7uc' // Update with your Docker Hub credentials ID
        DOCKER_IMAGE = "satyam1602/todo-app-cicd-practice:v1"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "cloning repo"
                git branch: 'master', url: 'https://github.com/stymjhrbd/TodoApp-dev.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo" building docker image"
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                  echo" pushing docker image"
                    withDockerRegistry(credentialsId: DOCKER_HUB_CREDENTIALS) {
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }

        // stage('Deploy to Minikube') {
        //     steps {
        //         sshagent(['ec2-ssh-credentials-id']) { // Add EC2 SSH credentials in Jenkins
        //             sh """
        //             ssh -o StrictHostKeyChecking=no ec2-user@<EC2_IP> '
        //             kubectl set image deployment/your-deployment-name your-container-name=$DOCKER_IMAGE
        //             kubectl rollout status deployment/your-deployment-name
        //             '
        //             """
        //         }
        //     }
        // }
    }
}
