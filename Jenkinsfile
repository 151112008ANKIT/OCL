pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                https://github.com/AnkitMU/OCL.git
                checkout scm
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
                // Add deployment steps here, e.g., copy files to a server or deploy to GitHub Pages
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
