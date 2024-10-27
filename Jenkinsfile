pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloning the repository
                git url: 'https://github.com/AnkitMU/OCL.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Installing dependencies
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                // Running tests
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                // Building the project
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps here, e.g., deploy to a server
                echo 'Deploying application...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
