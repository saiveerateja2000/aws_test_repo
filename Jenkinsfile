node {
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'echo "hello" '
                //groovyfile = load 'atom.groovy'
                sh 'make executable'
        }
        stage('Build') {
                sh 'echo "hello2" '
        }
        
        stage('Test') {
                // Run tests (example: JUnit)
                sh 'echo "hello3" '
                //groovyfile.building()
        }

        
        stage('Deploy') {
                // Deploy the application (example: Docker)
                sh 'echo "hello4" '
        }
    }
    

