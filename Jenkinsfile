pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from Git repository
                sh 'echo "hello" '
            }
        }
        
        stage('Build') {
            steps {
                // Build the project (example: Maven)
                sh 'echo "hello2" '
                def groovyfile = load 'atom.groovy'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests (example: JUnit)
                sh 'echo "hello3" '
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the application (example: Docker)
                sh 'echo "hello4" '
            }
        }
    }
    
    post {
        success {
            // This block is executed if the pipeline succeeds
            echo 'Pipeline succeeded!'
        }
        failure {
            // This block is executed if the pipeline fails
            echo 'Pipeline failed!'
        }
    }
}
